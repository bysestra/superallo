module User::Authenticatable
  extend ActiveSupport::Concern

  included do
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :masqueradable, :database_authenticatable, :registerable, :recoverable,
           :rememberable, :validatable, :omniauthable
  end
end
