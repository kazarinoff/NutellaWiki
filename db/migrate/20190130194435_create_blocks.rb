class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.string :name
      t.string :description
      t.text :content
      t.string :kind
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
