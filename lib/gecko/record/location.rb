require 'gecko/record/base'

module Gecko
  module Record
    class Location < Base
      attribute :address1,     String
      attribute :address2,     String
      attribute :city,         String
      attribute :country,      String
      attribute :holds_stock,  Boolean
      attribute :label,        String
      attribute :state,        String
      attribute :suburb,       String
      attribute :zip_code,     String

      attribute :status,       String,  readonly: true
    end

    class LocationAdapter < BaseAdapter
    end
  end
end
