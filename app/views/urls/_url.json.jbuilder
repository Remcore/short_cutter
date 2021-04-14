# frozen_string_literal: true

json.extract! url, :id, :short_url, :full_url, :open_count, :created_at, :updated_at
json.url url_url(url, format: :json)
