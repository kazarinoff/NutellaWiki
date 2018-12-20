class Display < ActiveRecord::Base
  belongs_to :block
  belongs_to :page
end
