class CreatePrintTypes < ActiveRecord::Migration
  def change
    create_table :print_types do |t|
      t.string :name
      t.string :name_abbr
      t.integer :old_id

      t.timestamps null: false
    end
  end
end
