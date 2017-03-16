class User < ApplicationRecord
  # Direct associations

  has_many   :friend_requests_received,
             :class_name => "FriendRequest",
             :foreign_key => "recipient_id",
             :dependent => :destroy

  has_many   :friend_requests_sent,
             :class_name => "FriendRequest",
             :foreign_key => "sender_id",
             :dependent => :destroy

  has_many   :comments,
             :dependent => :destroy

  has_many   :likes,
             :dependent => :destroy

  has_many   :recipes,
             :dependent => :destroy

  # Indirect associations

  has_many   :liked_recipes,
             :through => :likes,
             :source => :recipe

  has_many   :followers,
             :through => :friend_requests_received,
             :source => :sender

  has_many   :leaders,
             :through => :friend_requests_sent,
             :source => :recipient

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
