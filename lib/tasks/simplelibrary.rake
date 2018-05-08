# frozen_string_literal: true

namespace :simplelibrary do
  desc 'Sample data generator'
  task generate_sample_data: :environment do
    SampleDataGeneratorService.call
  end
end
