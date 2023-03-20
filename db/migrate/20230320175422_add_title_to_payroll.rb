class AddTitleToPayroll < ActiveRecord::Migration[7.0]
  def change
    add_column :payrolls, :title, :string
  end
end
