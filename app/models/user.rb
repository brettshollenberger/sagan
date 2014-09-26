class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :files,
    source_type: "Sfile",
    foreign_key: :owner_id

  has_many :curricula,
    inverse_of: :owner,
    foreign_key: :owner_id do

    def fork_file(file, new_parent)
      ::Curriculum.fork_file(self.new(file.attributes.merge(:owner_id => id), new_parent))
    end
  end

  has_many :course_materials,
    foreign_key: :owner_id
end
