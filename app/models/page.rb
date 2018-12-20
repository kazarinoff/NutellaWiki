class Page < ActiveRecord::Base
  belongs_to :user
  has_many:displays
  has_many:blocks, through: :displays
  validates :name, :description, :genre, presence:true
  validates :name, uniqueness:true

end
