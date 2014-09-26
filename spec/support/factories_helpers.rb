module FactoriesHelpers
  def curriculum_for_user(user)
    curriculum = FactoryGirl.create(:curriculum, owner: user)
    FactoryGirl.create_list(:course_material, 10, parent_node: curriculum)

    return curriculum
  end
end
