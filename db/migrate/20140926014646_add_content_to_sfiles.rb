class AddContentToSfiles < ActiveRecord::Migration
  def change
    add_column :sfiles, :content, :text
  end
end
