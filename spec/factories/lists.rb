# frozen_string_literal: true

FactoryBot.define do
  factory :list do
    name { Faker::Lorem.words }
  end
end
