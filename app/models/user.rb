class User < ActiveRecord::Base
  belongs_to :clan
  has_secure_password
  has_many:pages
  has_many:blocks
  has_many:comments
  validates :name, :email, presence:true
  validates :email, uniqueness:true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

end
