class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.text :content
      t.timestamp :publish_at
      t.timestamp :close_at
      t.integer :author

      t.timestamps
    end
  end
end
