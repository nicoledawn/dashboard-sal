class RemoveTitleFromPayroll < ActiveRecord::Migration[7.0]
  def change
    remove_column :payrolls, :title, :string
  end
end
