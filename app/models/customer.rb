class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def active_for_authentication?
    super && (self.is_valid == true)
  end

  has_many :shipping_addresses, dependent: :destroy
  has_many :cart_products, dependent: :destroy
  has_many :orders, dependent: :destroy

  validates :last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number, :email, presence: true

end
