class AddUserIdToMages < ActiveRecord::Migration[5.2]
  def change
    add_column :mages, :user_id, :integer
  end
end
