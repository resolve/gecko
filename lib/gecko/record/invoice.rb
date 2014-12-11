require 'gecko/record/base'

module Gecko
  module Record
    class Invoice < Base
      belongs_to :billing_address
      belongs_to :order
      belongs_to :payment_term
      belongs_to :shipping_address

      has_many :invoice_line_items

      attribute :due_at,          Date
      attribute :exchange_rate,   BigDecimal
      attribute :invoice_number,  String
      attribute :invoiced_at,     Date
      attribute :notes,           String

      attribute :destination_url, String,   readonly: true
      attribute :document_url,    String,   readonly: true
      attribute :created_at,      DateTime, readonly: true
      attribute :updated_at,      DateTime, readonly: true
    end

    class InvoiceAdapter < BaseAdapter

    end
  end
end
