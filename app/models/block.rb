class Block < ActiveRecord::Base
  belongs_to :user
  has_many:displays
  has_many:pages, through: :displays
  has_many:comments
  validates :name, :description, :kind, presence:true
  validates :name, uniqueness:true

end
