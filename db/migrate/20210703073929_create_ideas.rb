# frozen_string_literal: true

class CreateIdeas < ActiveRecord::Migration[5.2]
  def change
    create_table :ideas do |t|
      t.references :category, foreign_key: true, null: false
      t.text :body, null: false
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
