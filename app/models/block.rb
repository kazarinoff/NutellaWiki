class Block < ActiveRecord::Base
  belongs_to :user
  validates :description, :name, presence:true
  has_many:comments
  has_many:pages, through: :displays
  has_many:displays

end
