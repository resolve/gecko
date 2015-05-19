require 'gecko/record/base'

module Gecko
  module Record
    class Note < Base
      belongs_to :company
      belongs_to :uploader, class_name: 'User'
      attribute :body,             String
    end
    class NoteAdapter < BaseAdapter
    end
  end
end
