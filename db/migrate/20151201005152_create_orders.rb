class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
    	t.string :name
    	t.string :business
    	t.string :email
    	t.string :phone
    	t.integer :user_id

        t.timestamps null: false
    end

    add_index :orders, :user_id
  end
end
