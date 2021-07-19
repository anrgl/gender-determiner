class Dadata < ApplicationService
  def self.check_gender(full_name)
    auth_token = 'Token 7b11c5356f05ab5803e8ab3968c24b4dc4f2a9bc'
    x_secret = 'c69195188c7b13d12cbe4ac043be92bb28cb257d'
    headers = {:Authorization => auth_token, :"X-Secret" => x_secret, content_type: :json, accept: :json}
    payload = [full_name]
    resp = RestClient.post('https://cleaner.dadata.ru/api/v1/clean/name', payload.to_json, headers)
    body = resp.body.force_encoding('UTF-8')
    gender = JSON.parse(body).first['gender']
    {gender: gender, last_request: resp.headers[:date]}
  end
end