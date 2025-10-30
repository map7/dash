class AddColumnsToUsers < ActiveRecord::Migration[8.1]
  def change
    rename_column :users, :email_address, :email
    add_column :users, :verified, :boolean, null: false, default: false
    add_column :users, :otp_required_for_sign_in, :boolean, null: false, default: false
    add_column :users, :otp_secret, :string, null: false, default: ""
  end
end
