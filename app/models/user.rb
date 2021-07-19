class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_create :last_request_and_gender

  def correct?
    is_correct
  end

  def admin?
    is_admin
  end

  private
  def last_request_and_gender
    full_name = self.full_name
    data = Dadata.check_gender(full_name)
    self.gender = data[:gender]
    self.last_request = data[:last_request]
  end
end
