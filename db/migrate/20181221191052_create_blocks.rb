class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.string :name
      t.string :kind
      t.references :user, index: true, foreign_key: true
      t.text :body
      t.string :description
    end
  end
end
