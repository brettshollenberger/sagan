angular
  .module('ngRails')
  .controller('SidebarCtrl', ['$scope', 'Curriculum', 'User', 'CourseMaterial', 'AppService',
  function($scope, Curriculum, User, CourseMaterial, AppService) {

  	$scope.user = User.find("me").then(function(){
  		$scope.curricula = Curriculum.where({ owner_id: $scope.user.id });
  		$scope.currentCurriculum = AppService.setCurriculum($scope.curricula.first());
  	});

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
