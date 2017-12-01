class Photo < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  has_many :tags
  has_many :comments
  belongs_to :user

  acts_as_votable

  validates :title, :presence => true
  validates :user_id, :presence => true, numericality: { only_integer: true }
  validates :image, :presence => true
end
