class CreateSfiles < ActiveRecord::Migration
  def change
    create_table :siles do |t|
      t.string :name
      t.string :filetype
      t.string :type
      t.string :classification
      t.integer :parent_id
      t.integer :source_id
      t.integer :owner_id
      t.string :url

      t.timestamps
    end
  end
end
