class AddDateFieldToPayroll < ActiveRecord::Migration[7.0]
  def change
    add_column :payrolls, :payroll_date, :date
  end
end
