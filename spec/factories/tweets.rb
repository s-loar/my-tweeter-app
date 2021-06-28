# frozen_string_literal: true

FactoryBot.define do
  factory :tweet do
    body { Faker::Quote.robin.slice(0, 240) }
    liked_count { 1 }
    deleted_at { nil }
  end

  trait :with_deleted do
    deleted_at { 1.day.ago }
  end
end
