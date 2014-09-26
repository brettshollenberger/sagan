require "rails_helper"

describe "Course Materials API :", :type => :request do
  before(:all) do
    @curriculum        = curriculum_for_user(user)
    @curriculum2       = curriculum_for_user(user2)
    @forked_curriculum = Curriculum.fork_file(@curriculum)

    @course_material = @curriculum.course_materials.first
  end

  def valid_course_materials_json
    { :format => :json, :course_material => { :name => "Fight Club" } }
  end

  def forked_course_materials_json
    { :format => :json, :course_material => { :source_id => @course_material.id,
                                              :parent_id => @curriculum2.id } }
  end

  describe "Index Action :" do
    describe "Course Materials for user :" do
      describe "When not logged in :" do
        before(:each) do
          get "#{api_course_materials_path}?owner_id=#{user.id}"
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

          get "#{api_course_materials_path}?owner_id=#{user.id}"
        end

        it "is a successful request" do
          expect(response).to be_success
        end

        it "contains the user's curricula" do
          expect(json.map { |j| j["id"] }).to eq (@curriculum.course_materials.map(&:id) << @forked_curriculum.course_materials.map(&:id)).flatten
        end
      end

      describe "Course Materials from source" do
        before(:each) do
          login(user)

          get "#{api_course_materials_path}?source_id=#{@course_material.id}"
        end

        it "is a successful request" do
          expect(response).to be_success
        end

        it "contains the forked course materials" do
          expect(json.length).to eq 1
        end

        it "has the parent id of the forked curriculum" do
          expect(json.first["parent_id"]).to eq @forked_curriculum.id
        end
      end
    end
  end
  describe "Create Action :" do
    describe "When logged in :" do
      describe "Normal create" do
        before(:each) do
          login(user)

          post api_course_materials_path, valid_course_materials_json
        end

        it "is a successful request" do
          expect(response).to be_success
        end

        it "creates the course material" do
          expect(json["name"]).to eq "Fight Club"
        end
      end

      describe "Forking" do
        before(:each) do
          login(user)

          post api_course_materials_path, forked_course_materials_json

          @forked_course_material = CourseMaterial.find(json["id"])
        end

        it "is a successful request" do
          expect(response).to be_success
        end

        it "creates the course material" do
          expect(json["name"]).to eq @course_material.name
        end

        it "is sourced from the original material" do
          expect(json["source_id"]).to eq @course_material.id
        end

        it "has the parent of its new home" do
          expect(json["parent_id"]).to eq @curriculum2.id
        end

      end
    end
  end

  describe "Update action :" do
    describe "When logged in :" do
      describe "Normal update" do
        before(:each) do
          login(user)

          put api_course_material_path(@course_material), valid_course_materials_json
        end

        it "is a successful request" do
          expect(response).to be_success
        end

        it "updates the curriculum" do
          expect(json["name"]).to eq "Fight Club"
        end
      end
    end
  end

  describe "Delete action :" do
    describe "When logged in :" do
      before(:each) do
        login(user)

        delete api_course_material_path(@course_material)
      end

      it "is a successful request" do
        expect(response).to be_success
      end

      it "updates the curriculum" do
        expect(json["status"]).to eq "204"
      end

      it "deletes the course material" do
        expect { CourseMaterial.find(@course_material.id) }.to raise_error
      end
    end
  end
end
