class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :files,
    source_type: "Sfile",
    foreign_key: :owner_id

  has_many :curricula,
    foreign_key: :owner_id

end
