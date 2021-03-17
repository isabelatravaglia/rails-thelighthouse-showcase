class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find_by(title: params[:title].gsub!(/-/, ' '))
  end
end
