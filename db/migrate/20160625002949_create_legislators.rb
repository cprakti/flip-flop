class CreateLegislators < ActiveRecord::Migration
  def change
    create_table :legislators do |t|
      t.string :bioguide_id
      t.string :first_name
      t.string :last_name
      t.string :party
      t.string :twitter_account
      t.string :seniority
      t.string :next_election
      t.string :total_votes
      t.string :missed_votes
      t.string :total_present
      t.string :state
      t.string :missed_votes_pct
      t.string :votes_with_party_pct

      t.timestamps null: false
    end
  end
end
