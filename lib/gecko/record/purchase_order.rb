require 'gecko/record/base'

module Gecko
  module Record
    class PurchaseOrder < Base
      has_many :purchase_order_line_items
      has_many :procurements

      belongs_to :billing_address,    class_name: "Location"
      belongs_to :company
      belongs_to :currency

      # belongs_to :default_price_list, class_name: "PriceList"
      attribute :default_price_list_id, String

      belongs_to :stock_location,     class_name: "Location"
      belongs_to :supplier_address,   class_name: "Address"

      attribute :due_at,                Date
      attribute :email,                 String
      attribute :notes,                 String
      attribute :order_number,          String
      attribute :reference_number,      String
      attribute :status,                String
      attribute :tax_treatment,         String

      attribute :destination_url,       String,     readonly: true
      attribute :document_url,          String,     readonly: true
      attribute :procurement_status,    String,     readonly: true
      attribute :total,                 BigDecimal, readonly: true
      attribute :cached_quantity,       BigDecimal, readonly: true
      attribute :cached_total,          BigDecimal, readonly: true

      # DEPRECATED
      # attribute :tax_type, String
      # attribute :default_price_type_id
    end

    class PurchaseOrderAdapter < BaseAdapter

    end
  end
end
