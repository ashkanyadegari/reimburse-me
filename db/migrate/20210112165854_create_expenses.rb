class CreateExpenses < ActiveRecord::Migration[6.1]
  def change
    create_table :expenses do |t|
      t.string :description
      t.references :category, null: false, foreign_key: true
      t.datetime :expense_date
      t.boolean :reimbursement
      t.references :account, foreign_key: true
      t.references :report, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :project, foreign_key: true
      t.boolean :fapiao
      t.boolean :approved
      t.float :amount

      t.timestamps
    end
  end
end
