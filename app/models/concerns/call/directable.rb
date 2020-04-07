module Call::Directable
  extend ActiveSupport::Concern
  
  included do
    enum direction: %w( outbound inbound )
  end
end
