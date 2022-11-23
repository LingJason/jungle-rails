class AddNameLastToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name_last, :string
  end
end
