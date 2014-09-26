require "rails_helper"

describe "Sfiles API :", :type => :request do
  before(:all) do
    @curriculum        = curriculum_for_user(user)
    @curriculum2       = curriculum_for_user(user2)
    @forked_curriculum = Curriculum.fork_file(@curriculum)
  end

  def valid_course_materials_json
    { :format => :json, :course_material => { :name => "Fight Club" } }
  end

  def forked_course_materials_json
    { :format => :json, :course_material => { :source_id => @course_material.id,
                                              :parent_id => @curriculum2.id } }
  end

  describe "Show Action :" do
    describe "Sfiles ancestors :" do
      describe "When logged in :" do
        before(:each) do
          login(user)

          get "/api/sfiles/#{@curriculum.course_materials.first.id}/ancestors"
        end

        it "is a successful request" do
          expect(response).to be_success
        end

        it "contains the ancestors" do
        end
      end
    end
  end
end

