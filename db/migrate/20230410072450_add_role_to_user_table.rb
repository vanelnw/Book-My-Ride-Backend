class AddRoleToUserTable < ActiveRecord::Migration[7.0]
  def change
    ALTER TABLE users ADD COLUMN role VARCHAR(255) NOT NULL DEFAULT 'user';
  end
end
