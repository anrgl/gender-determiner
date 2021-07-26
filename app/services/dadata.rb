class Dadata < ApplicationService
  def self.check_gender(full_name)
    auth_token = Rails.application.credentials.dadata[:auth_token]
    x_secret = Rails.application.credentials.dadata[:x_secret]
    headers = {:Authorization => auth_token, :"X-Secret" => x_secret, content_type: :json, accept: :json}
    payload = [full_name]
    resp = RestClient.post('https://cleaner.dadata.ru/api/v1/clean/name', payload.to_json, headers)
    body = resp.body.force_encoding('UTF-8')
    gender = JSON.parse(body).first['gender']
    {gender: gender, last_request: resp.headers[:date]}
  end
end