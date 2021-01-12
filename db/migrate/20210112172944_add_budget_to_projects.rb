class AddBudgetToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :budget, :float
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
