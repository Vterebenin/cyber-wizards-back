class AddFunctionToCard < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :function, :string
  end
end
