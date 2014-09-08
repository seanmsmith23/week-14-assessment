class ChangeColumnFromEnd < ActiveRecord::Migration
  def change
    rename_column :prescriptions, :end, :finish
  end
end
