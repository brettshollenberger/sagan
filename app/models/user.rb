class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :files,
    source_type: "Sfile",
    foreign_key: :owner_id

  has_many :curricula,
    foreign_key: :owner_id do

    def fork_file(file, new_parent)
      Curricula.fork_file(Curricula.new(file.attributes.merge(:owner_id => self.id), new_parent))
    end
  end

  has_many :course_materials,
    foreign_key: :owner_id
end
