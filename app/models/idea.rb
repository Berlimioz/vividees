class Idea < ActiveRecord::Base
  attr_accessible :text, :user, :user_id
  belongs_to :user

  validates :text, presence: true
  validates :user_id, presence: true

end