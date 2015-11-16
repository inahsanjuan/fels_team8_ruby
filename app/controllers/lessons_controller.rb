class LessonsController < ApplicationController
  before_action :logged_in_user

  def show
    @lesson = Lesson.find params[:id] 
  end
    
  def create
    @lesson = current_user.lessons.create params_lesson
    if @lesson
      redirect_to [@lesson.category, @lesson]
    else
      flash[:danger] = "invalid"
      redirect_to categories_url
    end
    
  end
  private
  def params_lesson
    params.require(:lesson).permit :category_id
  end
end
