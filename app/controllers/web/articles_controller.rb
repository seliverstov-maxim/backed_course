class Web::ArticlesController < ApplicationController
  def index
    @collection = Article.limit(15)
  end
end
