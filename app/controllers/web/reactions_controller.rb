class Web::ReactionsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    Reaction.create(kind: permitted_params[:kind], article: @article, user: User.first)
    @article.reload
  end

  def permitted_params
    params.require(:reaction).permit(:kind)
  end
end

