angular
  .module('ngRails')
  .controller('CurriculaIndexCtrl', ['$scope', '$routeParams', 'Curriculum', 'CurrentCurriculum', 
  function($scope, $routeParams, Curriculum, CurrentCurriculum) {

    $scope.curriculum = Curriculum.find($routeParams.id).then(function() {
      $scope.curriculum.course_materials.findAll();
    });

  }]);
