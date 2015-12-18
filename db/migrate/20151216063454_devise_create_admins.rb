class DeviseCreateAdmins < ActiveRecord::Migration
  def self.up
    create_table(:admins) do |t|
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.boolean :god_mode, default: false
      t.datetime :remember_created_at
      t.timestamps null: false
    end

    add_index :admins, :email,                unique: true
  end

  def self.down
    drop_table :admins
  end
end
