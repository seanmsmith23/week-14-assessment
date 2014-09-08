class ChangeColumnInPrescrip < ActiveRecord::Migration
  def change
    remove_column :prescriptions, :medication_id
    add_column :prescriptions, :medication, :string
  end
end
