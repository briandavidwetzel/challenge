class CreateWordCounts < ActiveRecord::Migration[5.2]
  def change
    create_table :word_counts do |t|
      t.string :request_id, null: false
      t.integer :value, null: false
      t.timestamps
    end

    add_index :word_counts, :request_id, unique: true
  end
end
