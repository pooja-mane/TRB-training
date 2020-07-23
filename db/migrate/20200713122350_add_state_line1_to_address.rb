class AddStateLine1ToAddress < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :state, :string
    add_column :addresses, :line1, :string
  end
end
