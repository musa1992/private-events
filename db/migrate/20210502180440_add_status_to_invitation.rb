class AddStatusToInvitation < ActiveRecord::Migration[5.2]
  def change
    add_column :invitations, :status, :string
  end
end
