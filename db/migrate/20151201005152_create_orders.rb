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
        t.belongs_to :user, index: true
        
        t.timestamps null: false
    end
  end
end
