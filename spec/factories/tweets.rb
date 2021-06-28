# frozen_string_literal: true

FactoryBot.define do
  factory :tweet do
    body { "MyText" }
    liked_count { 1 }
    deleted_at { "2021-06-28 10:54:51" }
  end
end
