class CreateShareholders < ActiveRecord::Migration
  def change
    create_table :shareholders do |t|
      t.string :sname
      t.string :shid
      t.string :shid_cache
      t.references :document, foreign_key: true

      t.timestamps null: false
    end
  end
end
