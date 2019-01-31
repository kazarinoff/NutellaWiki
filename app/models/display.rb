class Display < ActiveRecord::Base
  belongs_to :page
  belongs_to :block
end
