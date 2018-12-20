class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.text :description
      t.string :genre

      t.timestamps null: false
    end
  end
end
