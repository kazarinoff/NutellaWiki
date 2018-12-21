class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :block, index: true, foreign_key: true
      t.text :body
    end
  end
end
