class ChangeDefaultValueToKindAndStatusFromEmployee < ActiveRecord::Migration[6.0]
  def change
    change_column :employees, :status, :integer, default: 1
    change_column :employees, :kind,   :integer, default: 1
  end
end
