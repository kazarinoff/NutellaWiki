class Page < ActiveRecord::Base
  belongs_to :user
  has_many:displays
  has_many:blocks, through: :displays
  validates :description, :name, presence:true

end
