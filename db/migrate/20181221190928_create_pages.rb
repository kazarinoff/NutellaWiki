class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.string :description
      t.references :user, index: true, foreign_key: true
      t.string :genre
    end
  end
end
