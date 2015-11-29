class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name
      t.string :business
      t.string :email
      t.string :phone
      t.string :product
      t.string :payment
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
