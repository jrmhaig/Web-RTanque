require 'rails_helper'

RSpec.describe ArenaController, type: :routing do
  describe "routing" do

    it "routes to #random" do
      expect(get: "/arena/random").to route_to("arena#random", format: :json)
    end
  end
end
