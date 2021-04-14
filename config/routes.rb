# frozen_string_literal: true

Rails.application.routes.draw do
  get "/urls", to: "urls#index"
  post "/urls", to: "urls#create"
  get "/urls/:short_url", to: "urls#show"
  get "/urls/:short_url/stats", to: "urls#show_stats"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
