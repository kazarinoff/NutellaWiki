class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.text :description
      t.text :body
      t.string :kind

      t.timestamps null: false
    end
  end
end
