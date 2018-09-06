class CreateTaggings < ActiveRecord::Migration[5.1]
  def change
    create_table :taggings do |t|
      t.string :tag_id, null: false
      t.integer :url_id, null: false
    end
    add_index :taggings, :url_id, unique: true
  end
end
