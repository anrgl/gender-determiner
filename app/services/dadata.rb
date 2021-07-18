class Dadata < ApplicationService
  def initialize(auth_token, x_secret, full_name)
    @auth_token = auth_token
    @x_secret = x_secret
    @full_name = full_name
  end

  def response
    headers = {:Authorization => @auth_token, :"X-Secret" => @x_secret, content_type: :json, accept: :json}
    payload = [@full_name]
    RestClient.post('https://cleaner.dadata.ru/api/v1/clean/name', payload.to_json, headers)
  end

  def self.gender(resp)
    body = resp.body.force_encoding('UTF-8')
    JSON.parse(body).first['gender']
  end

  def self.last_request(resp)
    resp.headers[:date]
  end
end