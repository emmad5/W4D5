class GoalsController < ApplicationController
    
  def new
    @goal = Goal.new
    render :new
  end
  
  def create
    @goal = Goal.create(user_id: params[:user_id], goal_params)
    
    if @goal.save
      redirect_to user_goal_url
    else
      flash.now[:errors] = ["No Goal? Idiot!"]
      render :new
    end
  end
  
  def show
    @goal = Goal.find_by(user_id: params[:user_id])
    
    if @goal
      render :show
    else
      flash.now[:errors] = @goal.errors.full_messges
      render :new
    end
  end
  
  def
  
  private
  def goal_params
    params.require(:goal).permit(:title, :description, :is_public)
  end
  
end
