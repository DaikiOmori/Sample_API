# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  describe '#create' do
    it 'is valid with name' do
      category = FactoryBot.build(:category)
      expect(category).to be_valid
    end

    it 'is valid without name' do
      category = Category.new(name: nil)
      category.valid?
      expect(category.errors[:name]).to include("can't be blank")
    end

    it 'is invalid with a not unique name' do
      category1 = FactoryBot.build(:category)
      category1.save
      category2 = FactoryBot.build(:category)
      category2.valid?
      expect(category2.errors[:name]).to include('has already been taken')
    end
  end
end
