# frozen_string_literal: true

class Tweet < ApplicationRecord
  validates :body, presence: true

  default_scope { visible.newest_top }
  scope :visible, -> { where(deleted_at: nil) }
  scope :newest_top, -> { order(created_at: :desc) }
  scope :with_deleted, -> { unscope(where: :deleted_at) }
  scope :deleted, -> { with_deleted.where.not(deleted_at: nil) }

  after_create_commit { broadcast_prepend_to "tweets" }
  after_update_commit { after_update_action }
  after_destroy_commit { broadcast_remove_to "tweets" }

  private

  def after_update_action
    if self.deleted_at.blank?
      broadcast_replace_to "tweets" 
      return 
    end

    broadcast_remove_to "tweets"
  end
end
