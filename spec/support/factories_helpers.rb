module FactoriesHelpers
  def curriculum_for_user(for_user)
    curriculum = FactoryGirl.create(:curriculum, owner: for_user)
    FactoryGirl.create_list(:course_material, 10, parent_node: curriculum, owner: for_user)

    return curriculum
  end
end
