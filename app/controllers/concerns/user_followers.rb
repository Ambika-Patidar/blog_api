require 'active_support'

module UserFollowers
  extend ActiveSupport::Concern

  def fetch_list_of_following_or_followers
    { followers: current_user.followers, followings: current_user.followings }
  end

  def fetch_following_user_articles
    current_user.followings.includes(:articles).map do |following|
      articles = following.articles.map do |article|
        { article: article, comments: article.comments }
      end
      { following_user_id: following.id, articles: articles }
    end
  end
end
