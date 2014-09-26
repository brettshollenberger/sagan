# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sfile do
    name "Javascript the Good Parts"
    filetype "txt"
    type "CourseMaterial"
    classification "reading"
    parent_id nil
    source_id nil
    owner_id nil
    url "http://crockford.io"
  end
end
