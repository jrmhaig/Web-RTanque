require 'rails_helper'

RSpec.describe UserController, type: :routing do
  describe "routing" do

    it "routes to #register" do
      expect(get: "/user/register").to route_to("user#register")
    end
  end
end
