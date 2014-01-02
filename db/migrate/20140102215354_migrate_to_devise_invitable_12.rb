# Required for devise_invitable 1.2
class MigrateToDeviseInvitable12 < ActiveRecord::Migration
  def change
    add_column :users, :invitation_created_at, :datetime
    change_column :users, :invitation_token, :string, limit: nil
  end
end
