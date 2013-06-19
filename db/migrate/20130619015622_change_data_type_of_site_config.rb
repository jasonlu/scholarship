class ChangeDataTypeOfSiteConfig < ActiveRecord::Migration
  def up
    change_column :site_configs, :value, :text
  end

  def down
    change_column :site_configs, :value, :string
  end
end
