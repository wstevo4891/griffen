class AddUploadsToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :buslicense, :string
    add_column :documents, :bpra, :string
    add_column :documents, :artinc, :string
    add_column :documents, :certform, :string
    add_column :documents, :opagree, :string
    add_column :documents, :stockcert, :string
    add_column :documents, :llclist, :string
    add_column :documents, :shlist, :string
    add_column :documents, :combuslicense, :string
    add_column :documents, :combpra, :string  	
  end
end
