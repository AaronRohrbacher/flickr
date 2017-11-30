class User < ApplicationRecord
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  has_many :photos
  has_many :tags

  validates :email, :presence => true
  validates :email, :uniqueness => true

  validates :username, :presence => true
  validates :username, :uniqueness => true

  validates :password, :presence => true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 ## THIS IS KEY FOR LOGGING IN WITH USERNAME INSTEAD OF EMAIL:

 ## ALSO GO TO CONFIG INITIALIZERS DEVISE.RB and UNCOMMENT LINE 37 AND CHANGE TO USERNAME
 #   def email_required?
 #     false
 #   end
 #
 #   def email_changed?
 #     false
 #   end
 end
