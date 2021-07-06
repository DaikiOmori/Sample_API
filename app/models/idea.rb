# frozen_string_literal: true

class Idea < ApplicationRecord
  belongs_to :category
  validates :category_id, presence: true
  validates :body, presence: true

  def all_ideas
    @ideas = Idea.joins(:category)
                 .select('ideas.id', 'categories.name', 'ideas.body', 'ideas.created_at')
    @ideas
  end

  def ideas_by_category_id(category_id)
    @ideas = Idea.joins(:category)
                 .where(category_id: category_id)
                 .select('ideas.id', 'categories.name', 'ideas.body', 'ideas.created_at')
    @ideas
  end
end
