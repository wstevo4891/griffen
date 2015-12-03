class AddUploadsToApplications < ActiveRecord::Migration
  def change
    add_column :orders, :voidcheck, :string
    add_column :orders, :dlicense, :string  	
  end
end
