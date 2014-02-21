class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.integer :profile_id
      t.string :profile_type

      t.timestamps
    end
    add_index :users, :profile_id
    add_index :users, :profile_type
  end
end
