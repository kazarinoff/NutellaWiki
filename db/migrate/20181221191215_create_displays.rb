class CreateDisplays < ActiveRecord::Migration
  def change
    create_table :displays do |t|
      t.references :page, index: true, foreign_key: true
      t.references :block, index: true, foreign_key: true
    end
  end
end
