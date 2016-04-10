class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :legalname
      t.string :dba
      t.string :address
      t.string :baddress
      t.string :city
      t.string :state
      t.string :bcity
      t.string :bstate
      t.string :zip
      t.string :bzip
      t.string :phone
      t.string :fax
      t.string :bphone
      t.string :bfax
      t.string :ftin
      t.string :email
      t.string :contact
      
      t.string :oname
      t.string :dob
      t.string :ssn
      t.string :ophone
      t.string :oaddress
      t.string :ocity
      t.string :ostate
      t.string :ozip
      
      t.string :avgt
      t.string :monv
      t.string :maxta
      t.string :qc
      t.string :tz
      t.string :pref
      t.string :prefn
      t.string :cw
      t.string :pl
      
      t.string :osig
      t.string :date
      t.string :opn
      t.string :sasig
      t.string :agentid
      t.string :iso
      
      t.string :dialup
      t.string :dumi
      t.string :dualcom
      t.string :dcmi
      t.string :msf12mi
      
      t.string :mi610
      t.string :mcfmi
      t.string :msf8mi
      t.string :carch
      t.string :carchmi
      
      t.string :confmi
      t.string :incrmi
      
      t.string :billmail
      t.string :billosig
      t.string :billdate
      t.string :billpn
      
      t.string :bankname
      t.string :bankaccount
      t.string :bankphone
      
      t.string :mtosig
      t.string :mtot
      t.string :mtdate
      t.string :mtpn
      t.string :mtsasig
      t.string :mtagentid
      t.string :mtiso
      
      t.string :yname
      t.string :fname
      t.string :faddress
      t.string :fcity
      t.string :fstate
      t.string :fzip
      t.string :fphone
      t.string :facc
      t.string :frn
      t.string :fan
      t.string :atype
      
      t.string :coname
      t.string :coatt
      t.string :coaddress
      t.string :cocity
      t.string :costate
      t.string :cozip
      t.string :cophone
      t.string :comail
      t.string :cosig
      t.string :codate
      
      t.string :verby
      t.string :appby
      
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
