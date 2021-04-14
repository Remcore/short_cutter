# frozen_string_literal: true

class UrlsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_url, only: %i[ show show_stats ]

  # GET /urls or /urls.json
  def index
    @urls = Url.all

    render json: @urls, status: :ok
  end

  # GET /urls/:short_url
  def show
    @url.increment!(:open_count) # rubocop:disable SkipsModelValidations
    Redis.current.hincrby(@url.get_redis_key, request.remote_ip, 1)

    render json: { full_url: @url.full_url }, status: :ok
  end

  # GET /urls/:short_url/stats
  def show_stats
    render json: {
      all: @url.open_count,
      details: Redis.current.hgetall(@url.get_redis_key)
    }, status: :ok
  end

  # POST /urls or /urls.json
  def create
    @url = Url.create(url_params)

    render json: { short_url: @url.short_url }, status: :created
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_url
      @url = Url.find_by(short_url: params[:short_url])
    end

    # Only allow a list of trusted parameters through.
    def url_params
      params.require(:url).permit(:full_url)
    end
end
