require 'gecko/record/base'

module Gecko
  module Record
    class Image < Base
      AVAILABLE_SIZES = [:full, :thumbnail]
      belongs_to :variant
      belongs_to :uploader, class_name: "User"

      attribute :name,             String
      attribute :remote_image_url, String
      attribute :image,            String

      attribute :position,         Integer, readonly: true
      attribute :base_path,        String, readonly: true
      attribute :file_name,        String, readonly: true
      attribute :versions,         Array[String], readonly: true

      # attribute :image_processing, Boolean

      # URL for image
      #
      # @param [Symbol] :size (:full) The image size, currently only :full
      #   and :thumbnail supported
      #
      # @return [String]
      #
      # @api public
      def url(size = :full)
        if size == :full
          file_path = file_name
        else
          file_path = "#{size}_#{file_name}"
        end
        [base_path, file_path].join("/")
      end
    end

    class ImageAdapter < BaseAdapter
    end
  end
end
