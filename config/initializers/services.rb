# frozen_string_literal: true

Dir.glob('app/services/**/*.rb') do |file|
  require_dependency Rails.root.join(file)
end
