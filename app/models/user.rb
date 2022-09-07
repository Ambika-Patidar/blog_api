class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :articles
  # Will return an array of follows for the given user instance
  has_many :received_follows, foreign_key: :followed_user_id, class_name: 'Follow', dependent: :destroy
  # Will return an array of users who follow the user instance
  has_many :followers, through: :received_follows, source: :follower, dependent: :destroy
  # returns an array of follows a user gave to someone else
  has_many :given_follows, foreign_key: :follower_id, class_name: 'Follow', dependent: :destroy
  # returns an array of other users who the user has followed
  has_many :followings, through: :given_follows, source: :followed_user, dependent: :destroy

  validates :full_name, :status, presence: true

  enum statuses: { '0' => 'public', '1' => 'private' }

  def jwt_payload
    super.merge('foo' => 'bar')
  end
end
