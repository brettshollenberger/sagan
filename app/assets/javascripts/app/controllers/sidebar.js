angular
  .module('ngRails')
  .controller('SidebarCtrl', ['$scope', 'Curriculum', 'User', 'CourseMaterial', 'AppService',
  function($scope, Curriculum, User, CourseMaterial, AppService) {

  	$scope.user = User.find("me");
  	console.log($scope.user);

    $scope.curricula = Curriculum.findAll();

    $scope.currentCurriculum = AppService.getCurriculum();

    $scope.$watch('currentCurriculum', function(newValue) {
    	AppService.setCurriculum(newValue);
    	$scope.courseMaterials = CourseMaterial.where({ parent_id: $scope.currentCurriculum }).then(function() {
	    	console.log($scope.courseMaterials);
	    });
    });



    $scope.setCurriculum = function(id) {
    	$scope.currentCurriculum = id;
    }

  }]);
