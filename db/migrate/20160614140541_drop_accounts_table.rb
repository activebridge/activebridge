class DropAccountsTable < ActiveRecord::Migration
  def change
    drop_table :accounts
  end
end
