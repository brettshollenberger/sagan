angular
  .module('ngRails')
  .controller('CurriculaIndexCtrl', ['$scope', 'Curriculum', 'User', 'CourseMaterial', 'AppService',
  function($scope, Curriculum, User, CourseMaterial, AppService) {

    var updateCurriculum = function() {
      $scope.currentRoot = Curriculum.find($scope.currentCurriculum).then(function() {
          $scope.currentRoot.course_materials.findAll();
      });
    }

    updateCurriculum();

    $scope.$watch(function () { return AppService.getCurriculum(); }, function (newValue) {
        if (newValue) {
          $scope.currentCurriculum = newValue;
          updateCurriculum();
        }
    });

    $scope.setParent = function(id) {

      $scope.currentRoot = CourseMaterial.find(id).then(function() {
        $scope.currentRoot.course_materials.findAll();  
        console.log(id);
      });
      
    }

  }]);
