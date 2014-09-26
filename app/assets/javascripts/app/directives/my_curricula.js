angular
	.module('ngRails')
	.directive('myCurricula', ['CurrentUser', 'CurrentCurriculum', function(CurrentUser, CurrentCurriculum) {
		return {
			scope: {
      },
			templateUrl: 'directives/my_curricula.html',
			link: function($scope, el, attrs) {

				$scope.$watch(function () { return CurrentCurriculum.getCurriculum(); }, function (newValue) {
			        if (newValue) $scope.currentCurriculum = newValue;
			    });
        		$scope.curricula = CurrentUser.curricula.where({user_id: CurrentUser.id});
			}
		}
	}]);
