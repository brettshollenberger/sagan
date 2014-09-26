class Curriculum < Sfile
  def filetype
    "directory"
  end

  def set_type
    self.type = "Curriculum"
  end

  def classification
    "curriculum"
  end

  has_many :course_materials,
    :foreign_key => "parent_id",
    :dependent => :destroy

end
