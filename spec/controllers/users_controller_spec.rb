require 'rails_helper'

RSpec.describe 'UsersController', type: :request do
  describe '/send_otp_code' do
    it 'should send otp code to user phone number' do
      user = build(:user)
      post '/send_otp_code', params: {user: {phone_number: user.phone_number, country_code: user.country_code}}
      payload = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(payload["message"]).to eq("An activation code would be sent to your phonenumber!")
      expect(payload["country_code"]).to eq user.country_code.to_s
      expect(payload["phone_number"]).to eq user.phone_number.to_s
    end

    it 'should create a new verified user' do
      user = build(:user)
      post '/users', params: { user: { phone_number: user.phone_number, country_code: user.country_code, otp_code: "1234"  } }
      payload = JSON.parse(response.body)
      auth_token = payload["auth_token"]
      user_token = JsonWebToken.decode(auth_token)

      expect(response.status).to eq 201
      expect(payload["user"]["phone_number"]).to eq(user.phone_number)
      expect(payload["user"]["country_code"]).to eq(user.country_code)
      expect(user_token["user_id"]).to eq(User.first.id)
      expect(payload["message"]).to eq "Phone number verified!"
    end
  end
end
