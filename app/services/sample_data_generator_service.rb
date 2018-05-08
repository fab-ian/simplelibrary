# frozen_string_literal: true

class SampleDataGeneratorService
  def self.call
    10.times do
      Book.create!(title: Faker::Book.title, description: Faker::ChuckNorris.fact)
    end
    puts 'Sample data has been generated successfully.'
  end
end
