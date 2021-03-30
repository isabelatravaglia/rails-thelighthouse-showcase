class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  def index
    @articles = Article.all
    @months = ["Jan", "Fev", "Mar", "Abr", "Mai", "Jun", "Jul", "Ago", "Set", "Out", "Nov", "Dez"]
  end

  def show
    @article = Article.find_by(title_param: params[:title_param])
  end
end
