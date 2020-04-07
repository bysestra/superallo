module Call::Statusable
  extend ActiveSupport::Concern
  
  included do
    enum status: %w( initiated completed )
  end
end
