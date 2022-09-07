require 'active_support'

module UserFollowers
  extend ActiveSupport::Concern

  def fetch_list_of_following_or_followers
    { followers: current_user.followers, followings: current_user.followings }
  end

  def fetch_following_user_articles
    current_user.followings.includes(:articles).map do |following|
      { following_user_id: following.id, articles: following.articles }
    end
  end
end
