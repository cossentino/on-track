class AddFromSocialToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :from_social, :boolean
  end
end
