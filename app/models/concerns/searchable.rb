module Searchable
  extend ActiveSupport::Concern
  
  included do
    searchkick index_name: -> { "#{name.tableize}-#{I18n.locale}" }
  end
end
