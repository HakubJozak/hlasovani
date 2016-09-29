class CreateProposerTypes < ActiveRecord::Migration
  def change
    create_table :proposer_types do |t|
      t.string :description
      t.integer :old_id

      t.timestamps null: false
    end
  end
end