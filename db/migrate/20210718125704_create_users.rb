class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :gender
      t.boolean :is_admin
      t.datetime :last_request

      t.timestamps
    end
  end
end
