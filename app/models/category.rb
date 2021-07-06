# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :ideas
  validates :name, presence: true, uniqueness: true
end
