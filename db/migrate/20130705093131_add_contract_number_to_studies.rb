class AddContractNumberToStudies < ActiveRecord::Migration
  def change
    add_column :studies, :contract_number, :string
    add_column :studies, :activated, :boolean, default: false
  end
end
