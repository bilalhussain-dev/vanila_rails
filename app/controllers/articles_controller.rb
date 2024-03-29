class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :destroy, :update]
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = User.first
    if @article.save
      flash[:notice] = "Article Posted Successfully"
      redirect_to article_path(@article)
    else
      render :new, status: :unprocessable_entity
    end
  end


  def show
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article Updated"
      redirect_to article_path(@article)
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = "Article Deleted Successfully"
    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :description)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end