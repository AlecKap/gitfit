class MovementsController < ApplicationController
  
  def index
    # binding.pry
    @movements = Movement.all
    @ordered_movements = case params[:order]
      when 'name_of_mover'
        Movement.order(name_of_mover: :asc)
      when 'name_of_mover_desc'
        Movement.order(name_of_mover: :desc)
      when 'type_of_movement'
        Movement.order(type_of_movement: :asc)
      when 'type_of_movement_desc'
        Movement.order(type_of_movement: :desc)
      when 'reps'
        Movement.order(reps: :asc)
      when 'reps_desc'
        Movement.order(reps: :desc)
      when 'weight'
        Movement.order(weight: :asc)
      when 'weight_desc'
        Movement.order(weight: :desc)
      when 'created_at'
        Movement.order(created_at: :asc)
      when 'created_at_desc'
        Movement.order(created_at: :desc)
      else
        Movement.newest_first
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