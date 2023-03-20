class AddUserIdToPayroll < ActiveRecord::Migration[7.0]
  def change
    add_column :payrolls, :user_id, :integer
  end
end
