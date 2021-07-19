class AddIsCorrectGenderToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :is_correct, :boolean, default: false
  end
end
