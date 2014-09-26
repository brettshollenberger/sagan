 angular
  .module('ngRails')
  .factory('CourseMaterial', ['ngActiveResource', function(ngActiveResource) {

    CourseMaterial.inherits(ngActiveResource.Base);

    CourseMaterial.belongsTo('curriculum', {
      foreignKey: 'parent_id'
    });

    CourseMaterial.belongsTo('course_material', {
      foreignKey: 'parent_id'
    });

    CourseMaterial.hasMany('course_materials');

    CourseMaterial.api.configure(function(config) {
      config.resource = 'course_materials';
    });

    function CourseMaterial() {
      this.string('name');
      this.string('filetype');
      this.string('classification');
      this.string('url');
      this.string('content');
    }

    CourseMaterial.prototype.parentNode = function() {
      if (!_.isUndefined(this.course_material)) {
        return this.course_material;
      }
      return this.curriculum;
    }

    CourseMaterial.prototype.$fork = function() {
      var parent_course_material_clone = _.cloneDeep(this);
      var source_id = parent_course_material_clone.id;

      delete parent_curriculum_clone.id;

      var child_course_material = CourseMaterial.new(_.defaults({
        source_id: source_id
      }, parent_course_material_clone));

      return child_course_material.$save();
    }

    CourseMaterial.validates({
      name:           { required: true },
      filetype:       { required: true, 
                        inclusion: { in: ["txt", "pdf", "md"] } 
                      },
      classification: { required: true, 
                        inclusion: { 
                          in: ["quiz", "assignment", "directory", "reading"] 
                        } 
                      }
    })

    return CourseMaterial;

  }]);
