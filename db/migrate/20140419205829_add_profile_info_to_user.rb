class AddProfileInfoToUser < ActiveRecord::Migration
  def change
    add_column :users, :phone_number, :string
    add_column :users, :description, :text
    add_column :users, :neighborhood, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :cause, :string
    add_column :users, :cause_percent, :integer
  end
end
