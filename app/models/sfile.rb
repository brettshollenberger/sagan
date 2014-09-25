class Sfile < ActiveRecord::Base

  before_save :set_type

  def self.types
    %w(Curriculum CourseMaterial)
  end

  def set_type
    self.type = self.type.classify || "Sfile"
  end

  # Parent/child relationships
  has_many :child_nodes,
    :class_name => "Sfile",
    :foreign_key => "parent_id",
    :dependent => :destroy

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

  belongs_to :owner,
    :class_name => "User",
    :foreign_key => :owner_id

  validates :type, :presence => true, :inclusion => { :in => types }

  def self.fork_file(file, new_parent)
    clone = file.attributes

    clone["source_id"] = clone["id"]
    clone.delete("id")

    if new_parent.respond_to?(:id)
      clone["parent_id"] = new_parent.id
    else
      clone["parent_id"] = new_parent.to_i
    end

    new_file = Sfile.create(clone)

    # Recurse
    if file.child_nodes.length > 0
      file.child_nodes.each do |child|
        Sfile.fork_file(child, new_file)
      end
    end

    new_file
  end
end
