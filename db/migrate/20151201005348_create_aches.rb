class CreateAches < ActiveRecord::Migration
  def change
    create_table :aches do |t|
      t.string :bmn
      t.string :iso
      t.string :isoid
      t.string :agentname
      
      t.string :legalname
      t.string :taxid
      t.string :dba
      t.string :dbaddress
      t.string :maddress
      t.string :dbacity
      t.string :mcity
      t.string :dbastate
      t.string :dbazip
      t.string :mstate
      t.string :mzip
      t.string :bphone
      t.string :bfax
      t.string :contact
      t.string :title
      t.string :ownertype
      t.string :goodstype
      t.string :totalbustime
      t.string :locbustime
      t.string :webaddress
      t.string :email
      
      t.string :pname 
      t.string :pphone
      t.string :ptitle
      t.string :pequity
      t.string :paddress
      t.string :pdob
      t.string :pcity
      t.string :pssn
      t.string :pstate
      t.string :pzip
      t.string :pdlicense
      
      t.string :drate
      t.string :tfee
      t.string :msfee
      t.string :mminfee
      
      t.string :termtype
      
      t.string :msig
      t.string :mdate
      t.string :csig
      t.string :cdate
      
      t.string :appby
      t.string :apptitle
      t.string :appdate
      
      t.references :user, foreign_key: true
      
      t.timestamps null: false
    end
  end
end

