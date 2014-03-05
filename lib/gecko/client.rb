require 'oauth2'
require 'gecko/helpers/record_helper'

module Gecko
  class Client
    extend Helpers::RecordHelper

    record :Address
    record :Company

    record :Fulfillment
    record :FulfillmentLineItem
    record :Order
    record :OrderLineItem

    record :Product
    record :Variant

    # Return OAuth client
    #
    # @return [OAuth2::Client]
    #
    # @api private
    attr_reader :oauth_client

    # Access the OAuth AccessToken for this client
    #
    # @return [OAuth2::AccessToken]
    #
    # @api public
    attr_accessor :access_token

    # Initialize a new Gecko client object with an instantiated OAuth2::Client
    #
    # @param [String] client_id
    # @param [String] client_secret
    # @param [#to_hash] extra options hash to pass to the OAuth2::Client
    #
    # @return [undefined]
    #
    # @api private
    def initialize(client_id, client_secret, options={})
      setup_oauth_client(client_id, client_secret, options)
    end

    # Authorize client from existing access and refresh token
    #
    # @example
    #   client.authorize_from_existing("ABC", "DEF", "1393982563")
    #
    # @param [String] access_token
    # @param [String] refresh_token
    # @param [String] expires_at
    #
    # @return [OAuth2::AccessToken]
    #
    # @api public
    def authorize_from_existing(access_token, refresh_token, expires_at)
      @access_token = OAuth2::AccessToken.new(oauth_client, access_token, {
        refresh_token: refresh_token,
        expires_at:    expires_at
      })
    end

    # Authorize client by fetching a new access_token via refresh token
    #
    # @example
    #   client.authorize_from_refresh_token("DEF")
    #
    # @param [String] refresh_token
    #
    # @return [OAuth2::AccessToken]
    #
    # @api public
    def authorize_from_refresh_token(refresh_token)
      @access_token = oauth_client.get_token({
        client_id:     oauth_client.id,
        client_secret: oauth_client.secret,
        refresh_token: refresh_token,
        grant_type:    'refresh_token'
      })
    end

  private
    def setup_oauth_client(client_id, client_secret, options)
      defaults = {
        site:          'https://api.tradegecko.com',
        authorize_url: 'https://go.tradegecko.com/oauth/authorize'
      }
      @oauth_client = OAuth2::Client.new(client_id, client_secret, defaults.merge(options))
    end
  end
end
