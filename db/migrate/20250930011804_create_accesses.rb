class CreateAccesses < ActiveRecord::Migration[8.0]
  def change
    create_table :accesses do |t|
      t.integer :menu_position
      t.string :login
      t.string :password
      t.string :auto_login
      t.references :user, null: false, foreign_key: true
      t.references :app, null: false, foreign_key: true

      t.timestamps
    end
  end
end
