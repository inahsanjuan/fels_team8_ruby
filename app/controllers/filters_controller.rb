class FiltersController < ApplicationController
  before_action :logged_in_user
  def show
    @lesson_words = Lesson.find(params[:id]).lesson_words.choosen_word
  end
end
