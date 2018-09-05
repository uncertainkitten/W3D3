class FixVisits < ActiveRecord::Migration[5.1]
  def change
    change_column_null :visits, :user_id, false
  end
end
