class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :block
  validates :user, :body, presence:true

end
