require "rails_helper"

describe "Curricula API :", :type => :request do

  before(:each) do
    # @workspace        = workspace_for_user(user)
    # @project          = project_in_workspace(@workspace)
    # @random_workspace = FactoryGirl.create(:workspace)
    # @random_project   = project_in_workspace(@random_workspace)
  end

  describe "Index Action :" do
    before(:each) do
      FactoryGirl.create_list(:project, 10)
    end

    describe "When request is nested by workspace :" do
      describe "When not logged in :" do
        before(:each) do
          get api_v1_workspace_projects_path(@workspace)
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
        end
      end
    end
  end
end
