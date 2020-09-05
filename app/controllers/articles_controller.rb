class ArticlesController < ApplicationController
    def index
    end

    def create 
        @article = Article.new(article_params)
        #@article = Article.new(title: params[:article][:title], text: params[:article][:text])
        @article.save
        redirect_to article_path(@article.id)

    end

    def show
        @article = Article.find(params[:id])
    endd


    private
    def article_params
        params.require(:article).permit(:title, :text)
    end

end
