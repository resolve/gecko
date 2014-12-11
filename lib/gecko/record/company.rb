require 'gecko/record/base'

module Gecko
  module Record
    class Company < Base
      belongs_to :assignee, class_name: 'User'
      belongs_to :default_stock_location, class_name: "Location"
      belongs_to :default_tax_type, class_name: "TaxType"
      # belongs_to :default_price_list,   class_name: "PriceList"
      attribute :default_price_list_id,  String
      # belongs_to :default_payment_term, class_name: "PaymentTerm"
      # belongs_to :default_ledger_account

      has_many :addresses
      has_many :contacts
      has_many :notes

      attribute :company_code,           String
      attribute :company_type,           String
      attribute :default_discount_rate,  BigDecimal
      attribute :default_tax_type_id,    Integer
      attribute :description,            String
      attribute :email,                  String
      attribute :fax,                    String
      attribute :name,                   String
      attribute :phone_number,           String
      attribute :status,                 String
      attribute :tax_number,             String
      attribute :website,                String
    end

    class CompanyAdapter < BaseAdapter
      # Override plural_path to properly pluralize company
      def plural_path
        'companies'
      end
    end
  end
end
