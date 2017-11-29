class Tag < ActiveRecord::Base
  belongs_to :photo

  validates :tag, :presence => true
  validates :photo_id, :presence => true, numericality: { only_integer: true }
end
