# frozen_string_literal: true

require 'time'
class IdeaService
  def initialize(params)
    @params = params
    @category = if Category.exists?(name: @params['category_name'])
                  Category.find_by(name: @params['category_name'])
                else
                  Category.new(name: @params['category_name'])
                end
  end

  def all_ideas
    @idea = Idea.new
    @ideas = @idea.all_ideas
    retun_idea_list
  end

  def ideas_by_category_name
    @idea = Idea.new
    @ideas = @idea.ideas_by_category_id(@category.id)
    retun_idea_list
  end

  def create_idea
    if @category.id
    @idea = Idea.new(category_id: @category.id, body: @params['body'])
    @idea.save!
    else
      save_idea_and_category
    end
  end

  private

  def save_idea_and_category
    @category.transaction do
      @category.save!
      @idea = Idea.new(category_id: @category.id, body: @params['body'])
      @idea.save!
    end
  rescue StandardError => e
    render e.message
  end

  def retun_idea_list
    @result = []
    @ideas.each do |c|
      @result += [
        'id' => c['id'],
        'category' => c['name'],
        'body' => c['body'],
        'created_at' => Time.parse(c['created_at'].to_s).to_i
      ]
    end
    @result
  end
end
