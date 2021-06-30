# frozen_string_literal: true

class Tweet < ApplicationRecord
  validates :body, presence: true

  default_scope { visible.newest_top }
  scope :visible, -> { where(deleted_at: nil) }
  scope :newest_top, -> { order(created_at: :desc) }
  scope :with_deleted, -> { unscope(where: :deleted_at) }
  scope :deleted, -> { with_deleted.where.not(deleted_at: nil) }

  after_create_commit { broadcast_prepend_to "tweets" }
  after_update_commit { broadcast_replace_to "tweets" }
  after_destroy_commit { broadcast_remove_to "tweets" }
end
