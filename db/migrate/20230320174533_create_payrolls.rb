class CreatePayrolls < ActiveRecord::Migration[7.0]
  def change
    create_table :payrolls do |t|

      t.timestamps
    end
  end
end
