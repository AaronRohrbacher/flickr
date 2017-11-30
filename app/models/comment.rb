class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :photo

  acts_as_votable

  validates :content, :presence => true
  validates :user_id, :presence => true, numericality: { only_integer: true }

end
