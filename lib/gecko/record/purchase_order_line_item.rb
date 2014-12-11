require 'gecko/record/base'

module Gecko
  module Record
    class PurchaseOrderLineItem < Base
      belongs_to :procurement
      belongs_to :purchase_order
      belongs_to :tax_type
      belongs_to :variant

      attribute :freeform,          Boolean
      attribute :label,             String
      attribute :position,          Integer
      attribute :price,             BigDecimal
      attribute :quantity,          BigDecimal
      attribute :tax_rate_override, BigDecimal

      attribute :base_price,        BigDecimal, readonly: true
      attribute :extra_cost_value,  BigDecimal, readonly: true
      attribute :image_url,         String,     readonly: true
      # DEPRECATED
      # attribute :tax_rate, String
    end

    class PurchaseOrderLineItemAdapter < BaseAdapter

    end
  end
end
