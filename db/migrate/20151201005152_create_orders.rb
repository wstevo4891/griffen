class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
    	t.string :name
    	t.string :business
    	t.string :email
    	t.string :phone
        t.string :product
        t.string :payment
    	t.integer :user_id
        t.references :user, foreign_key: true
        
        t.timestamps null: false
    end
  end
end
