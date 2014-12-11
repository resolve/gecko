require 'gecko/record/base'
require 'gecko/record/fulfillment_line_item'

module Gecko
  module Record
    class Fulfillment < Base
      belongs_to :billing_address,  class_name: 'Address'
      belongs_to :order
      belongs_to :shipping_address, class_name: 'Address'

      has_many :fulfillment_line_items

      attribute :delivery_type,    String
      attribute :exchange_rate,    String
      attribute :notes,            String
      attribute :packed_at,        Date
      attribute :receipt,          Hash
      attribute :received_at,      DateTime
      attribute :service,          String
      attribute :shipped_at,       DateTime
      attribute :status,           String
      attribute :tracking_company, String
      attribute :tracking_number,  String
      attribute :tracking_url,     String

      attribute :destination_url,  String,  readonly: true
    end

    class FulfillmentAdapter < BaseAdapter
      # Parse sideloaded FulfillmentLineItems into the Identity map
      # instead of refetching them
      def parse_records(json)
        records = super
        parse_line_items(json) if json['fulfillment_line_items']
        records
      end

      def parse_line_items(json)
        @client.FulfillmentLineItem.parse_records(json)
      end
    end
  end
end
