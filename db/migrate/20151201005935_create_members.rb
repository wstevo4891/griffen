class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :mname
      t.string :memid
      t.string :memid_cache
      t.integer :document_id

      t.timestamps null: false
    end
    
    add_index :members, :document_id
  end
end
