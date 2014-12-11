require 'gecko/record/base'

module Gecko
  module Record
    class Address < Base
      belongs_to :company

      attribute :address1,     String
      attribute :address2,     String
      attribute :city,         String
      attribute :company_name, String
      attribute :country,      String
      attribute :email,        String
      attribute :label,        String
      attribute :latitude,     BigDecimal
      attribute :longitude,    BigDecimal
      attribute :phone_number, String
      attribute :state,        String
      attribute :suburb,       String
      attribute :zip_code,     String

      attribute :status,       String,  readonly: true

      alias_method :country_code, :country
    end

    class AddressAdapter < BaseAdapter
      # Override plural_path to properly pluralize address
      def plural_path
        'addresses'
      end
    end
  end
end
