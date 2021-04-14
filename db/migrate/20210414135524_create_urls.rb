# frozen_string_literal: true

class CreateUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :urls do |t|
      t.string :short_url, null: false
      t.string :full_url, null: false
      t.integer :open_count, null: false, default: 0

      t.timestamps
    end

    add_index :urls, :short_url, unique: true
  end
end
