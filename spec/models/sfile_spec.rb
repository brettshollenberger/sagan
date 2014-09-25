require 'rails_helper'

RSpec.describe Sfile, :type => :model do
  before(:each) do
    @directory = FactoryGirl.create(:sfile)
    @sub_file = FactoryGirl.create(:sfile, :parent_node => @directory)
    @fork = FactoryGirl.create(:sfile, :source => @directory)
  end

  describe "Directory-type files" do
    it "creates sub-files" do
      expect(@sub_file.parent_node).to eq @directory
      expect(@directory.child_nodes).to include @sub_file
    end

    it "does not create sub-files out of forks" do
      expect(@directory.child_nodes).to_not include @fork
      expect(@fork.parent_node).to_not eq @directory
    end
  end

  describe "Fork-type files" do
    it "forks files" do
      expect(@fork.source).to eq @directory
      expect(@directory.forks).to include @fork
    end

    it "does not add child nodes to forks" do
      expect(@sub_file.source).to be_nil
      expect(@directory.forks).to_not include @sub_file
    end
  end

  describe "Valid types" do
    describe "Types" do
      it "is valid with one of the valid types" do
        @sub_file.type = "Curriculum"
        expect(@sub_file).to be_valid

        @sub_file.type = "CourseMaterial"
        expect(@sub_file).to be_valid
      end

      it "is invalid with some other type" do
        @sub_file.type = "SomethingRandom"
        expect(@sub_file).to_not be_valid
      end
    end
  end

  describe "Forking a file" do
    before(:each) do
      @new_directory = FactoryGirl.create(:sfile)
      @fork = Sfile.fork_file(@directory, @new_directory)
    end

    it "recursively forks the file and its children" do
      expect(@fork.child_nodes.length).to eq 1
    end
  end
end
