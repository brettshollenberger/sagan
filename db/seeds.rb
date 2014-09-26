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
                                  :owner_id => @user.id,
                                  :filetype => "directory",
                                  :classification => "directory")

@quizzes = CourseMaterial.create(:name => "Quizzes",
                                 :parent_id => @curriculum.id,
                                 :owner_id => @user.id,
                                 :filetype => "directory",
                                 :classification => "directory")

@reading1 = CourseMaterial.create(:name => "Javascript the Definitive Guide",
                                  :parent_id => @readings.id,
                                  :owner_id => @user.id,
                                  :content => "It was the best of Javascript, it was the worst of Javascript",
                                  :filetype => "md",
                                  :classification => "reading")

@reading2 = CourseMaterial.create(:name => "Javascript the Good Parts",
                                  :parent_id => @readings.id,
                                  :owner_id => @user.id,
                                  :content => "This book is intentionally left blank",
                                  :filetype => "md",
                                  :classification => "reading")

@quiz1 = CourseMaterial.create(:name => "Quiz 1",
                               :parent_id => @quizzes.id,
                               :owner_id => @user.id,
                               :content => "Question 1 ... ",
                               :filetype => "txt",
                               :classification => "quiz")

@quiz2 = CourseMaterial.create(:name => "Quiz 2",
                               :parent_id => @quizzes.id,
                               :owner_id => @user.id,
                               :content => "Question 2...",
                               :filetype => "txt",
                               :classification => "quiz")

@syllabus = CourseMaterial.create(:name => "Syllabus",
                                  :parent_id => @curriculum.id,
                                  :owner_id => @user.id,
                                  :content => "The course syllabus. You should do your work",
                                  :filetype => "md",
                                  :classification => "reading")

@icebreaker = CourseMaterial.create(:name => "Icebreaker Exercise",
                                  :parent_id => @curriculum.id,
                                  :owner_id => @user.id,
                                  :content => "What's your favorite power ranger's favorite power?",
                                  :filetype => "md",
                                  :classification => "reading")

@prequiz = CourseMaterial.create(:name => "Pre-Quiz",
                                  :parent_id => @curriculum.id,
                                  :owner_id => @user.id,
                                  :content => "What is a javascript?",
                                  :filetype => "md",
                                  :classification => "quiz")

@fork = Curriculum.fork_file(@curriculum)

@fork.name = "Fork of Javascript for Beginners"
@fork.save

@reading3 = CourseMaterial.create(:name => "Effective Javascript",
                                  :parent_node => @fork,
                                  :owner_id => @user.id,
                                  :content => "It's the Javacrips vs the Javabloods",
                                  :filetype => "md",
                                  :classification => "reading")

@curriculum = Curriculum.create(:name => "Migrancy, Culture, and Identity Literature",
                                :owner_id => @user2.id)

@readings = CourseMaterial.create(:name => "Readings",
                                  :parent_id => @curriculum.id,
                                  :owner_id => @user2.id,
                                  :filetype => "directory",
                                  :classification => "directory")

@quizzes = CourseMaterial.create(:name => "Quizzes",
                                 :parent_id => @curriculum.id,
                                 :owner_id => @user2.id,
                                 :filetype => "directory",
                                 :classification => "directory")

@reading1 = CourseMaterial.create(:name => "The Satanic Verses",
                                  :parent_id => @readings.id,
                                  :owner_id => @user2.id,
                                  :content => "Hi, am Salman Rushdie and am ver kewl",
                                  :filetype => "md",
                                  :classification => "reading")

@reading2 = CourseMaterial.create(:name => "The Namesake",
                                  :parent_id => @readings.id,
                                  :owner_id => @user2.id,
                                  :content => "Hi, am Jumpa Lahiri and am p kewl",
                                  :filetype => "md",
                                  :classification => "reading")

@quiz1 = CourseMaterial.create(:name => "The Migrant Quiz",
                               :parent_id => @quizzes.id,
                               :owner_id => @user2.id,
                               :content => "Question is ... ",
                               :filetype => "txt",
                               :classification => "quiz")

@quiz2 = CourseMaterial.create(:name => "Culture Quiz",
                               :parent_id => @quizzes.id,
                               :owner_id => @user2.id,
                               :content => "What is a culture?",
                               :filetype => "txt",
                               :classification => "quiz")

@syllabus = CourseMaterial.create(:name => "Migrancy, Culture, & Syllabus",
                                  :parent_id => @curriculum.id,
                                  :owner_id => @user2.id,
                                  :content => "The course syllabus. You should do your work and not move away",
                                  :filetype => "md",
                                  :classification => "reading")

@icebreaker = CourseMaterial.create(:name => "Migrancy Icebreaker",
                                  :parent_id => @curriculum.id,
                                  :owner_id => @user2.id,
                                  :content => "Where you stay? What's your dad like?",
                                  :filetype => "md",
                                  :classification => "reading")

@prequiz = CourseMaterial.create(:name => "Pre-Quiz",
                                  :parent_id => @curriculum.id,
                                  :owner_id => @user2.id,
                                  :content => "What is an other?",
                                  :filetype => "md",
                                  :classification => "quiz")

@fork = Curriculum.fork_file(@curriculum)

@fork.name = "Fork of Migrancy, Culture, and Identity Literature"
@fork.save

@reading3 = CourseMaterial.create(:name => "East West",
                                  :parent_node => @fork,
                                  :owner_id => @user2.id,
                                  :content => "Some east, some west",
                                  :filetype => "md",
                                  :classification => "reading")
