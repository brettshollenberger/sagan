require 'rails_helper'

RSpec.describe Curriculum, :type => :model do
  before(:each) do
    @curriculum = FactoryGirl.create(:curriculum)
  end

  it "is always a directory" do
    expect(@curriculum.filetype).to eq "directory"
  end

  it "always has the type Curriculum" do
    expect(@curriculum.type).to eq "Curriculum"
  end

  it "is always classification curriculum" do
    expect(@curriculum.classification).to eq "curriculum"
  end
end
