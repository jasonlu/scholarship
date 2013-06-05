class AlterSiteConfigSchema < ActiveRecord::Migration
  def up
    #remove_column :site_configs, :copyright, :description, :keywords, :sitename
    add_column :site_configs, :key, :string
    add_column :site_configs, :value, :string
  end
end
