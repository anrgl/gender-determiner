class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_save :last_request_and_gender

  private
  def last_request_and_gender
    auth_token = 'Token 7b11c5356f05ab5803e8ab3968c24b4dc4f2a9bc'
    x_secret = 'c69195188c7b13d12cbe4ac043be92bb28cb257d'
    full_name = self.full_name
    resp = Dadata.new(auth_token, x_secret, full_name).response
    self.gender = Dadata.gender(resp)
    self.last_request = Time.parse(Dadata.last_request(resp))
  end
end
