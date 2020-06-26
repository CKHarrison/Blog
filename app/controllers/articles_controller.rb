class ArticlesController < ApplicationController
  include ArticlesHelper

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  # article params are strong params coming from a method in the article_helper file
  def create
    @article = Article.new(article_params)
    @article.save
    flash.notice = "'#{@article.title}' successfully created!"
    redirect_to article_path(@article)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    flash.notice = " '#{@article.title.capitalize}' edited!"

    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    title = @article.title
    @article.destroy
    flash.notice = "'#{title}' deleted"
    redirect_to articles_path
  end
end
