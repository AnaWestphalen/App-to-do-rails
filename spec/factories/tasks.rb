# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    title { Faker::Hipster.word }
    description { Faker::Hipster.sentence }
    completed { true }
    association :list, factory: :list
    association :user, factory: :user
  end
end
