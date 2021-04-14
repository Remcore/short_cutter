# frozen_string_literal: true

class Url < ApplicationRecord
  validates :full_url, presence: true

  before_save :create_short_url

  def get_redis_key
    "urls:#{self.id}"
  end
  private
    def create_short_url
      self.short_url = SecureRandom.alphanumeric(6) if self.short_url.blank?
    end
end
