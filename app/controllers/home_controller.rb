class HomeController < ApplicationController
  def welcome
    @news = News.order(publish_at: :desc)
    @courses = Course.order(due_at: :desc)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @news }
    end
  end
end
