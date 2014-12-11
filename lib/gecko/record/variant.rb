require 'gecko/record/base'

module Gecko
  module Record
    class Variant < Base
      class VariantLocation
        include Virtus.model
        attribute :location_id,     Integer
        attribute :committed_stock, BigDecimal
        attribute :stock_on_hand,   BigDecimal
        attribute :bin_location,    String
      end

      class VariantPrice
        include Virtus.model
        attribute :price_list_id,    String
        attribute :value,            BigDecimal
      end

      belongs_to :product
      has_many :images

      attribute :buy_price,       BigDecimal
      attribute :composite,       Boolean
      attribute :description,     String
      attribute :keep_selling,    Boolean
      attribute :manage_stock,    Integer
      attribute :max_online,      Integer
      attribute :name,            String
      attribute :online_ordering, Boolean
      attribute :opt1,            String
      attribute :opt2,            String
      attribute :opt3,            String
      attribute :position,        Integer
      attribute :retail_price,    BigDecimal
      attribute :sellable,        Boolean
      attribute :sku,             String
      attribute :supplier_code,   String
      attribute :taxable,         Boolean
      attribute :upc,             String
      attribute :weight,          String
      attribute :wholesale_price, BigDecimal

      attribute :locations,       Array[VariantLocation]
      attribute :variant_prices,  Array[VariantPrice]

      ## Read Only
      attribute :committed_stock, BigDecimal, readonly: true
      attribute :last_cost_price,     BigDecimal, readonly: true
      attribute :moving_average_cost, BigDecimal, readonly: true
      attribute :product_name,    String,   readonly: true
      attribute :product_status,  String,   readonly: true
      attribute :product_type,    String,   readonly: true
      attribute :status,          String,   readonly: true
      attribute :stock_on_hand,   BigDecimal, readonly: true

      # Returns a display name for a variant
      #
      # @example
      #   variant.display_name #=> "ABC12-Alpha Rocket"
      #
      # @return [String]
      #
      # @api public
      def display_name
        if name.nil? || !name.include?(product_name)
          parts = [sku, product_name, name]
        else
          parts = [sku, name]
        end
        parts.select { |part| part && part.length }.join(' - ')
      end

      # attribute :is_online

      ## DEPRECATED
      # attribute :prices,                 Hash[String => BigDecimal],  readonly: true
      # attribute :stock_levels,           Hash[Integer => BigDecimal], readonly: true
      # attribute :committed_stock_levels, Hash[Integer => BigDecimal], readonly: true
      # attribute :online_id
      # attribute :reorder_point,   Integer
    end

    class VariantAdapter < BaseAdapter
    end
  end
end
