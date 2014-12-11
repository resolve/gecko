require 'gecko/record/base'

module Gecko
  module Record
    class Product < Base
      has_many :variants
      attribute :brand,        String
      attribute :description,  String
      attribute :name,         String
      attribute :opt1,         String
      attribute :opt2,         String
      attribute :opt3,         String
      attribute :product_type, String
      attribute :status,       String
      attribute :supplier,     String
      attribute :tags,         String

      # attribute :image_url,    String,  readonly: true
      # attribute :quantity,     Integer, readonly: true
      # attribute :search_cache, String,  readonly: true
    end

    class ProductAdapter < BaseAdapter
    end
  end
end
