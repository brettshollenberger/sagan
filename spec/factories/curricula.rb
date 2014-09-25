# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :curriculum do
    name "Javascript for Beginners"
    filetype "directory"
    type "Curriculum"
    classification "curriculum"
    parent_id nil
    source_id nil
    owner_id nil
  end
end
