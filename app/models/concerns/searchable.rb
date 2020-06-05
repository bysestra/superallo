module Searchable
  extend ActiveSupport::Concern
  
  included do
    searchkick index_name: -> { "#{name.tableize}-en" }
  end
end
