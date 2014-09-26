# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Creating users"
@user = User.create(:first_name => "Shalom", :last_name => "Aptekar", :email => "shalom@gmail.com", 
            :password => "foobar29")

@user2 = User.create(:first_name => "Brett", :last_name => "Cassette", :email => "brett@gmail.com",
                     :password => "foobar29")

puts "Creating curricula"
@curriculum = Curriculum.create(:name => "Javascript for Beginners",
                                :owner_id => @user.id)

@readings = CourseMaterial.create(:name => "Readings",
                                  :parent_id => @curriculum.id,
                                  :owner_id => @user.id)

@quizzes = CourseMaterial.create(:name => "Quizzes",
                                 :parent_id => @curriculum.id,
                                 :owner_id => @user.id)

@reading1 = CourseMaterial.create(:name => "Javascript the Definitive Guide",
                                  :parent_id => @readings.id,
                                  :owner_id => @user.id,
                                  :content => "It was the best of Javascript, it was the worst of Javascript")

@reading2 = CourseMaterial.create(:name => "Javascript the Good Parts",
                                  :parent_id => @readings.id,
                                  :owner_id => @user.id,
                                  :content => "This book is intentionally left blank")

@quiz1 = CourseMaterial.create(:name => "Quiz 1",
                               :parent_id => @quizzes.id,
                               :owner_id => @user.id,
                               :content => "Question 1 ... ")

@quiz2 = CourseMaterial.create(:name => "Quiz 2",
                               :parent_id => @quizzes.id,
                               :owner_id => @user.id,
                               :content => "Question 2...")

@syllabus = CourseMaterial.create(:name => "Syllabus",
                                   :parent_id => @curriculum.id,
                                   :owner_id => @user.id)

@fork = Curriculum.fork_file(@curriculum)

@fork.name = "Fork of Javascript for Beginners"
@fork.save

@reading3 = CourseMaterial.create(:name => "Effective Javascript",
                                  :parent_node => @fork,
                                  :owner_id => @user.id,
                                  :content => "It's the Javacrips vs the Javabloods")

@reading3 = CourseMaterial.create(:name => "Effective Javascript",
                                  :parent_node => @fork,
                                  :owner_id => @user.id,
                                  :content => "It's the Javacrips vs the Javabloods")
