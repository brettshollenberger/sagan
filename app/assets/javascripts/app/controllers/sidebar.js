angular
.module('ngRails')
.controller('SidebarCtrl', ['$scope', '$routeParams', 'Curriculum', 'User', 'CourseMaterial', 'CurrentCurriculum',
    function($scope, $routeParams, Curriculum, User, CourseMaterial, CurrentCurriculum) {

      $scope.$watch(function () { return CurrentCurriculum.getCurriculum(); }, function (newValue) {
          if (newValue) $scope.currentCurriculum = newValue;
      });

    }]);
