class ArticlesController < ApplicationController
  
  def new 
    @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)
    if @article.save
      #do something
      flash[:notice] = "Article was succesfully created"
      redirect_to article_path(@article)
    else 
      render 'new'
    end
   # render plain: params[:article].inspect
    #@article.save
    #redirect_to article_path(@article)
  end
  
  private
    def article_params
    params.require(:article).permit(:title, :description)
    end
  
  
end