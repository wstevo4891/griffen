class AddUploadsToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :voidcheck, :string
    add_column :applications, :dlicense, :string  	
  end
end
