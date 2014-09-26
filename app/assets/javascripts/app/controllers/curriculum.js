angular
  .module('ngRails')
  .controller('CurriculaIndexCtrl', ['$scope', '$rootScope', 'Curriculum', 'User', 'CourseMaterial',
  function($scope, $rootScope, Curriculum, User, CourseMaterial) {

    $rootScope.currentCurriculum = Curriculum.find(1);

    $scope.setParent = function(id) {
      $rootScope.currentCurriculum = CourseMaterial.find(id).then(function() {
        $rootScope.currentCurriculum.course_materials.findAll();
      });
    }

    $rootScope.$watch('currentCurriculum', function() {
      $rootScope.currentCurriculum.course_materials.findAll();
    });

  }]);
