class CreateApps < ActiveRecord::Migration[8.0]
  def change
    create_table :apps do |t|
      t.string :name
      t.string :description
      t.string :url
      t.string :global_login
      t.string :global_password

      t.timestamps
    end
  end
end
