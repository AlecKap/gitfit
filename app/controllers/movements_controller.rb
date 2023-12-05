class MovementsController < ApplicationController
  
  def index
    @movements = Movement.all
  end
  
  def new
    @movement = Movement.new
  end

  def create
    movement = Movement.new(movement_params)
    if movement.save
      flash[:notice] = "Movement successfully recorded!"
      redirect_to movements_path
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