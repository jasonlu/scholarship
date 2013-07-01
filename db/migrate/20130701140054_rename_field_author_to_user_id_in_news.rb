class RenameFieldAuthorToUserIdInNews < ActiveRecord::Migration
  def up
    rename_column :news, :author, :user_id
    
  end

  def down
    rename_column :news, :user_id, :author
  end
end
