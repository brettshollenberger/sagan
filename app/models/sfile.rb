class Sfile < ActiveRecord::Base

  def self.types
    %w(curriculum course_material)
  end

  # Parent/child relationships
  has_many :child_nodes,
    :class_name => "Sfile",
    :foreign_key => "parent_id"

  belongs_to :parent_node,
    :class_name => "Sfile",
    :foreign_key => "parent_id"

  # Fork relationships
  has_many :forks,
    :class_name => "Sfile",
    :foreign_key => "source_id"

  belongs_to :source,
    :class_name => "Sfile",
    :foreign_key => "source_id"

  validates :type, :presence => true, :inclusion => { :in => types }

  # def fork_file
  # end
end
