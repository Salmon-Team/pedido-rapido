class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.decimal :amount, precision: 5, scale: 2
      t.integer :method
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
