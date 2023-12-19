class MovementsController < ApplicationController
  
  def index
    @movements = Movement.all

    filter_params = params.permit(:name_of_mover, :type_of_movement)
    filtered_movements = Movement.all

    filter_params.each do |param, value|
      filtered_movements = filtered_movements.where(param => value) if value.present?
    end

    @ordered_movements = case params[:order]
    when 'name_of_mover'
      filtered_movements.order(name_of_mover: :asc)
    when 'name_of_mover_desc'
      filtered_movements.order(name_of_mover: :desc)
    when 'type_of_movement'
      filtered_movements.order(type_of_movement: :asc)
    when 'type_of_movement_desc'
      filtered_movements.order(type_of_movement: :desc)
    when 'reps'
      filtered_movements.order(reps: :asc)
    when 'reps_desc'
      filtered_movements.order(reps: :desc)
    when 'weight'
      filtered_movements.order(weight: :asc)
    when 'weight_desc'
      filtered_movements.order(weight: :desc)
    when 'created_at'
      filtered_movements.order(created_at: :asc)
    when 'created_at_desc'
      filtered_movements.order(created_at: :desc)
    else
      filtered_movements.newest_first
  end
  end
  
  def new
    @movement = Movement.new
  end

  def create
    movement = Movement.new(movement_params)
    if movement.save
      flash[:notice] = "Movement successfully recorded!"
      render turbo_stream: turbo_visit(movements_path)
    else
      flash[:alert] = "Please fill in all required fields. You may leave Weight field blank if using just body weight."
      redirect_to new_movement_path
    end
  end

  def destroy
    Movement.destroy(params[:id])
    redirect_to movements_path
    flash[:notice] = "Movement successfully deleted!"
  end

  private

  def movement_params
    params.require(:movement).permit(:name_of_mover, :type_of_movement, :reps, :weight)
  end
end