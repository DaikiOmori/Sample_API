# frozen_string_literal: true

module Api
  module V1
    class IdeasController < ApplicationController
      def index
        @ideas = IdeaService.new(params).all_ideas
        render status: 200, json: { data: @ideas }
      end

      def show
        @ideas = IdeaService.new(params).ideas_by_category_name
        if @ideas.empty?
          render status: 404
        else
          render status: 200, json: { data: @ideas }
        end
      end

      def create
        @is_success = IdeaService.new(params).create_idea
        if @is_success
          render status: 201
        else
          render status: 422
        end
      end

      private

      def idea_params
        params.require(:idea).permit(:body)
      end

      def category_params
        params.require(:category).permit(:name)
      end
    end
  end
end
