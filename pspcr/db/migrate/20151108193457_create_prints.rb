class CreatePrints < ActiveRecord::Migration
  def change
    create_table :prints do |t|
      t.integer :type_id
      t.integer :print_state_id
      t.integer :number
      t.integer :number_after_slash
      t.integer :proposer_type_id
      t.integer :organ_id
      t.integer :organ_election_term
      t.integer :person_id
      t.string :proposer
      t.string :name
      t.string :name_full
      t.date :proposed_at
      t.datetime :delivered_at
      t.datetime :next_discussion_at
      t.date :electronic_version_at
      t.integer :discussion_date_change_type
      t.integer :discussion_date_change
      t.boolean :is_fast_proposal
      t.string :url
      t.boolean :is_eu
      t.boolean :with_vote_of_no_confidence
      t.integer :state
      t.integer :old_id

      t.timestamps null: false
    end
  end
end
