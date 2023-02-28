# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    title { Faker::Hipster.word }
    description { Faker::Hipster.sentence }
    completed { Faker::Boolean.boolean }
    association :list, factory: :list
  end
end
