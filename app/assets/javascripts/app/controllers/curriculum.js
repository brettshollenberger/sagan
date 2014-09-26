angular
  .module('ngRails')
  .controller('CurriculaIndexCtrl', ['$scope', 'Curriculum', 'User', 'CourseMaterial', 'AppService',
  function($scope, Curriculum, User, CourseMaterial, AppService) {

    var updateCurriculum = function() {
      $scope.curriculum = Curriculum.find($scope.currentCurriculum).then(function() {
          $scope.curriculum.course_materials.findAll();
      });
    }

    updateCurriculum();

    $scope.$watch(function () { return AppService.getCurriculum(); }, function (newValue) {
        if (newValue) {
          $scope.currentCurriculum = newValue;
          updateCurriculum();
        }
    });

  }]);
