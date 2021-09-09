# frozen_string_literal: true

namespace :import do
  desc 'Runs all static data importing tasks'
  task all: %w[
    locations
  ]
end