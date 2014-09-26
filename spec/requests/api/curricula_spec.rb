require "rails_helper"

describe "Curricula API :", :type => :request do
  before(:all) do
    @curriculum        = curriculum_for_user(user)
    @curriculum2       = curriculum_for_user(user2)
    @forked_curriculum = Curriculum.fork_file(@curriculum)
  end

  def valid_curriculum_json
    { :format => :json, :curriculum => { :name => "The Best Curriculum" } }
  end

  def forked_curriculum_json
    { :format => :json, :curriculum => { :source_id => @curriculum.id } }
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

    describe "Curricula from source" do
      before(:each) do
        login(user)

        get "#{api_curricula_path}?source_id=#{@curriculum.id}"
      end

      it "is a successful request" do
        expect(response).to be_success
      end

      it "contains the forked curricula" do
        expect(json.first["id"]).to eq @forked_curriculum.id
      end

      it "has no parent" do
        expect(json.first["parent_id"]).to be_nil
      end
    end
  end

  describe "Create Action :" do
    describe "When logged in :" do
      describe "Normal create" do
        before(:each) do
          login(user)

          post api_curricula_path, valid_curriculum_json
        end

        it "is a successful request" do
          expect(response).to be_success
        end

        it "creates the curriculum" do
          expect(json["name"]).to eq "The Best Curriculum"
        end
      end

      describe "Forking" do
        before(:each) do
          login(user)

          post api_curricula_path, forked_curriculum_json

          @curriculum3 = Curriculum.find(json["id"])
        end

        it "is a successful request" do
          expect(response).to be_success
        end

        it "creates the curriculum" do
          expect(json["name"]).to eq @curriculum.name
        end

        it "forks all children of the parent node" do
          expect(@curriculum3.course_materials.length).to eq @curriculum.course_materials.length
        end

        it "makes the new curriculum the parent node of the child nodes" do
          expect(@curriculum3.course_materials.map(&:parent_id).all? {
            |id| id == @curriculum3.id
          }).to eq true
        end
      end
    end
  end

  describe "Update action :" do
    describe "When logged in :" do
      describe "Normal update" do
        before(:each) do
          login(user)

          put api_curriculum_path(@curriculum), valid_curriculum_json
        end

        it "is a successful request" do
          expect(response).to be_success
        end

        it "updates the curriculum" do
          expect(json["name"]).to eq "The Best Curriculum"
        end
      end
    end
  end
end
