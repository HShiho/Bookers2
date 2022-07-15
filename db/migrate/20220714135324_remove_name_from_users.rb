class AddNameUsers < ActiveRecord::Migration[6.1]
  def change
    add_index :users, :name, unique: true
    add_column :users, :name, :string
  end
end
