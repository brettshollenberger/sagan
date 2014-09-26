require 'rails_helper'

RSpec.describe CourseMaterial, :type => :model do
  before(:each) do
    @course_material = FactoryGirl.create(:course_material)
  end

  it "is txt, directory, or md" do
    expect(@course_material.filetype).to eq "md"
  end

  it "has type CourseMaterial" do
    expect(@course_material.type).to eq "CourseMaterial"
  end

  it "is classified" do
    expect(@course_material.classification).to eq "reading"
  end
end
