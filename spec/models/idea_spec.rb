# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Idea, type: :model do
  describe '#create' do
    it 'is valid with a exists category_id body' do
      category = create(:category)
      idea = category.ideas.build(
        category_id: category.id,
        body: 'テスト'
      )
      expect(idea).to be_valid
    end

    it 'is invalid without body' do
      category = create(:category)
      idea = category.ideas.build(
        category_id: category.id
      )
      idea.valid?
      expect(idea.errors[:body]).to include("can't be blank")
    end

    it 'is invalid without category_id' do
      idea = Idea.new(category_id: nil)
      idea.valid?
      expect(idea.errors[:category_id]).to include("can't be blank")
    end
  end
end
