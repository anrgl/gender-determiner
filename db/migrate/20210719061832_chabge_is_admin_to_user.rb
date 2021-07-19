class ChabgeIsAdminToUser < ActiveRecord::Migration[6.1]
  def change
    change_column_default  :users, :is_admin, from: nil, to: false
  end
end
