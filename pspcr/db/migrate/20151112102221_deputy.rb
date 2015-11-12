class Deputy < ActiveRecord::Migration
  def change
  	 create_table :deputies do |t|
       t.integer :artificial_id
       t.belongs_to :person, index: true
       t.string :web
       t.string :street
       t.string :city
       t.string :postal_code
       t.string :email
       t.string :telefon
       t.string :fax
       t.timestamps null: false
     end
   end
end