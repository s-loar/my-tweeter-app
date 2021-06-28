# frozen_string_literal: true

class Tweet < ApplicationRecord
  validates :body, presence: true

  default_scope { visible.newest_top }
  scope :visible, -> { where(deleted_at: nil) }
  scope :newest_top, -> { order(created_at: :desc) }
  scope :with_deleted, -> { unscope(where: :deleted_at) }
  scope :deleted, -> { with_deleted.where.not(deleted_at: nil) }
end
