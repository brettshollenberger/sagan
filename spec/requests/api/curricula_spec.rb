require "rails_helper"

describe "Curricula API :", :type => :request do
  before(:all) do
    @curriculum = curriculum_for_user(user)
    @curriculum2 = curriculum_for_user(user2)
  end

  describe "Index Action :" do
    describe "Curricula for user :" do
      describe "When not logged in :" do
        before(:each) do
          get "#{api_curricula_path}?owner_id=#{user.id}"
        end

        it "It is not a successful request" do
          expect(response).to_not be_success
        end

        it "It responds with an error message" do
          expect(json["error"]).to eq("You need to sign in or sign up before continuing.")
        end
      end

      describe "When logged in :" do
        before(:each) do
          login(user)

          get "#{api_curricula_path}?owner_id=#{user.id}"
        end

        it "is a successful request" do
          expect(response).to be_success
        end

        it "contains the user's curricula" do
          expect(json.first["id"]).to eq @curriculum.id
        end

        it "does not contain another user's curriculum", :focus do
          expect(json.count { |curric| curric["id"] == @curriculum.id }).to eq 1
          expect(json.count { |curric| curric["id"] == @curriculum2.id }).to eq 0
        end
      end
    end
  end
end
