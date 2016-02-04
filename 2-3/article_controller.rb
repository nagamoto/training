class ArticlesController < ApplicationController
  def show
    @user = current_user
  end

  def get_title
    @article = Aricle.where(user_id: @user.id).first
    @comments = Comment.where(article_id: @article.id)
  end


end
