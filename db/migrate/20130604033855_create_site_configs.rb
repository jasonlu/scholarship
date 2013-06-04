class CreateSiteConfigs < ActiveRecord::Migration
  def change
    create_table :site_configs do |t|
      t.string :sitename
      t.string :description
      t.string :keywords
      t.string :copyright

      t.timestamps
    end
  end
end
