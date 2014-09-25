module FactoriesHelpers
  def curriculum_for_user(user)
    if user.curricula.empty?
      @curriculum = FactoryGirl.create(:curriculum, owner: user)
      FactoryGirl.create_list(:course_material, 10, parent_node: @curriculum)
    else
      @curriculum = user.curricula.first
    end

    return @curriculum
  end
end
