class CreateShareholders < ActiveRecord::Migration
  def change
    create_table :shareholders do |t|
      t.string :sname
      t.string :shid
      t.string :shid_cache
      t.integer :document_id

      t.timestamps null: false
    end
    
    add_index :shareholders, :document_id
  end
end
