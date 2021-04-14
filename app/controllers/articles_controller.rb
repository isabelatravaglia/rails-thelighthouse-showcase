class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @articles = Article.all
    @months = ["Jan", "Fev", "Mar", "Abr", "Mai", "Jun", "Jul", "Ago", "Set", "Out", "Nov", "Dez"]
  end

  def show
    @article = Article.find_by(title_param: params[:title_param])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:success] = "Article successfully created"
      redirect_to article_path(title_param: @article.title_param)
      # redirect_to controller: 'article', action: 'show', title_param: @article.title_param
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def edit
    @article = Article.find_by(title_param: params[:title_param])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:success] = "Article was successfully updated"
      redirect_to article_path(title_param: @article.title_param)
    else
      flash[:error] = "Something went wrong"
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      flash[:success] = 'Article was successfully deleted.'
      redirect_to articles_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to article_path(title_param: @article.title_param)
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :partner_id, :rich_body, :photo, article_category_ids: [])
  end
end
