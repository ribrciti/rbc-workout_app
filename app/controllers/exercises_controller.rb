class ExercisesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_exercise, only: [ :show, :edit, :update, :destroy ]

  def index
    @exercises = Exercise.exercises_by(current_user).all
  end

  def show
  end

  def new
    @exercise = Exercise.new
    @exercise.user_id = current_user.id      
  end

  def create
    @exercise = current_user.exercises.new(exercise_params)

    if @exercise.save
      flash[:success] = "Exercise has been created"
      redirect_to [current_user, @exercise]      
    else
      flash[:danger] = "Exercise has not been created"
      render :new
    end
  end

  def edit    
  end

  def update
    if @exercise.update(exercise_params)
      flash[:success] = "Exercise has been updated"
      redirect_to [current_user, @exercise]      
    else
      flash[:danger] = "Exercise has not been updated"
      render :edit
    end
    
  end

    private

  def exercise_params
    params.require(:exercise).permit(:duration_in_min, :workout, :workout_date, :user_id)
  end

  def set_exercise
    @exercise = Exercise.find(params[:id])
  end
end
