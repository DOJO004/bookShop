class ChangeUserRoleDefault < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :role, 'client'
  end
end
