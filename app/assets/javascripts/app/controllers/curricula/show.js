angular
  .module('ngRails')
  .controller('CurriculaShowCtrl', ['$scope', '$routeParams', 'Curriculum', 'CurrentCurriculum',
  function($scope, $routeParams, Curriculum, CurrentCurriculum) {
    $scope.curriculum = Curriculum.find($routeParams.id).then(function() {
      $scope.curriculum.course_materials.findAll();
    });

    $scope.$watch('curriculum', function(newValue) {
      CurrentCurriculum.setCurriculum(newValue);
    });



  }]);
