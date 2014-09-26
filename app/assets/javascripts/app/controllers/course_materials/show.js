angular
  .module('ngRails')
  .controller('CourseMaterialsShowCtrl', ['$scope', '$routeParams', 'CourseMaterial',
  function($scope, $routeParams, CourseMaterial) {

    $scope.course_material = CourseMaterial.find($routeParams.id);

  }]);
