angular
  .module('ngRails')
  .controller('CurriculaIndexCtrl', ['$scope', '$routeParams', 'Curriculum', 
  function($scope, $routeParams, Curriculum) {

    $scope.curriculum = Curriculum.find($routeParams.id).then(function() {
      $scope.curriculum.course_materials.findAll();
    });

  }]);
