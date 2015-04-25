class AddDetailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :profile_id, :integer
    add_column :users, :profile_type, :string
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
  end
end
