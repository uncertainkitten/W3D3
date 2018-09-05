class GenericizeUserIdIndexInVisits < ActiveRecord::Migration[5.1]
  def change
    remove_index :visits, :url_id
    remove_index :visits, :user_id
    add_index :visits, :url_id
    add_index :visits, :user_id
  end
end
