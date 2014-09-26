angular
  .module('ngRails')
  .controller('SidebarCtrl', ['$scope', '$rootScope', 'Curriculum', 'User', 'CourseMaterial',
  function($scope, $rootScope, Curriculum, User, CourseMaterial) {

  	$scope.user = User.find("me").then(function(){
  		$scope.curricula = Curriculum.where({ owner_id: $scope.user.id });
  	});



    $scope.setRootItem = function(rootItem) {
    	$rootScope.currentCurriculum = rootItem;
      console.log($rootScope.currentCurriculum);
    }

  }]);
