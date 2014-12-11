require 'gecko/record/base'

module Gecko
  module Record
    class OrderLineItem < Base
      belongs_to :order
      belongs_to :variant
      belongs_to :tax_type

      has_many :fulfillment_line_items
      has_many :invoice_line_items

      attribute :discount,  BigDecimal
      attribute :freeform,  Boolean
      attribute :label,     String
      attribute :line_type, String
      attribute :position,  Integer
      attribute :price,     BigDecimal
      attribute :quantity,  BigDecimal
      attribute :tax_rate_override,  BigDecimal

      attribute :shippable, Boolean, readonly: true
      attribute :image_url, String,     readonly: true

      # DEPRECATED
      attribute :tax_rate,  BigDecimal
    end

    class OrderLineItemAdapter < BaseAdapter
    end
  end
end
