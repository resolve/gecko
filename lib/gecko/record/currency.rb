require 'gecko/record/base'

module Gecko
  module Record
    class Currency < Base
      attribute :delimiter, String
      attribute :format,    String
      attribute :iso,       String
      attribute :name,      String
      attribute :precision, Integer
      attribute :rate,      BigDecimal
      attribute :separator, String
      attribute :symbol,    String
    end

    class CurrencyAdapter < BaseAdapter
      # Override plural_path to properly pluralize currency
      def plural_path
        'currencies'
      end
    end
  end
end
