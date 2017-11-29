class Photo < ActiveRecord::Base
  has_many :tags
  belongs_to :user
  acts_as_votable

  validates :title, :presence => true
  validates :user_id, :presence => true, numericality: { only_integer: true }
end
