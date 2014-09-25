# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :course_material do
    name "Javascript the Definitive Guide"
    filetype "md"
    classification "reading"
    parent_id nil
    source_id nil
    owner_id nil
  end
end
