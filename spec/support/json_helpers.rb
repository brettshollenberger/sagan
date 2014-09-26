include Warden::Test::Helpers

module Requests
  module JsonHelpers
    def user
      @user ||= FactoryGirl.create(:user)
    end

    def user2
      @user2 ||= FactoryGirl.create(:user)
    end

    def login(user)
      login_as user, scope: :user
    end

    def json
      @json ||= JSON.parse(response.body)
    end
  end
end
