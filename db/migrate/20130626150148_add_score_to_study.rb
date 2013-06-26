class AddScoreToStudy < ActiveRecord::Migration
  def change
    add_column :studies, :score, :float
    add_column :studies, :starts_at, :date
    add_column :studies, :ends_at, :date
    add_column :studies, :passed, :integer
  end
end
