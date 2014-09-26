# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@user = User.create(:first_name => "Shalom", :last_name => "Aptekar", :email => "shalom@gmail.com", 
            :password => "foobar29")

@curriculum = Curriculum.create(:name => "Javascript for Beginners", :owner_id => @user.id)
@readings = CourseMaterial.create(:name => "Readings", :parent_id => @curriculum.id, :owner_id => @user.id)
@quizzes = CourseMaterial.create(:name => "Quizzes", :parent_id => @curriculum.id, :owner_id => @user.id)
@reading1 = CourseMaterial.create(:name => "Javascript the Definitive Guide", :parent_id => @readings.id, :owner_id => @user.id)
@reading2 = CourseMaterial.create(:name => "Javascript the Good Parts", :parent_id => @readings.id, :owner_id => @user.id)
@quiz1 = CourseMaterial.create(:name => "Quiz 1", :parent_id => @quizzes.id, :owner_id => @user.id)
@quiz2 = CourseMaterial.create(:name => "Quiz 2", :parent_id => @quizzes.id, :owner_id => @user.id)

Curriculum.fork_file(@curriculum)
