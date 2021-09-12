class AddPoweredToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :powered, :boolean
  end
end
