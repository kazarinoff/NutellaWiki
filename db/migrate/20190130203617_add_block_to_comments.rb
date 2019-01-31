class AddBlockToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :block, index: true, foreign_key: true
  end
end
