# frozen_string_literal: true

FactoryBot.define do
  factory :list do
    name { Faker::Lorem.sentence(word_count: 3) }
    association :user, factory: :user
  end
end
