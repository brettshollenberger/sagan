angular
  .module('ngRails')
  .controller('CourseMaterialsNewCtrl', ['$scope', '$routeParams', '$location', 'CourseMaterial',
  function($scope, $routeParams, $location, CourseMaterial) {
    $scope.course_material = CourseMaterial.new({name: "New Assignment", parent_id: $routeParams.id, filetype: "md", classification: "assignment"});

    $scope.course_material.after("save", function() {
      $location.path('course_materials', $routeParams.id);
    });
  }]);
