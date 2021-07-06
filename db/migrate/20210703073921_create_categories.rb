# frozen_string_literal: true

class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name, null: false, index: true
      t.datetime :created_at
      t.datetime :updated_at
    end
    add_index :categories, [:name], unique: true
  end
end
