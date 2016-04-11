class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :mname
      t.string :memid
      t.string :memid_cache
      t.references :document, foreign_key: true

      t.timestamps null: false
    end
  end
end
