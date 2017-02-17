require 'rails_helper'

RSpec.describe ArenaController, type: :controller do

  describe "GET #home" do
    before(:each) do
      sign_in User.create(
        email: 'test@example.com',
        password: 'password',
        password_confirmation: 'password'
      )
    end

    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end
  end

end
