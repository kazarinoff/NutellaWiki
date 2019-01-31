class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :blocks, :content, :body
  end
end
