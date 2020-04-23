module Searchable
  extend ActiveSupport::Concern
  
  included do
    searchkick
  end
end
