class Tag < ActiveRecord::Base
  belongs_to :photo
  has_many :photos
  belongs_to :user

  validates :tag, :presence => true
  validates :photo_id, :presence => true, numericality: { only_integer: true }
  validates :user_id, :presence => true, numericality: { only_integer: true }

end
