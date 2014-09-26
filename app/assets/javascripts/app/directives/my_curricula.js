angular
	.module('ngRails')
	.directive('myCurricula', ['CurrentUser', function(CurrentUser) {
		return {
			scope: {
      },
			templateUrl: 'directives/my_curricula.html',
			link: function($scope, el, attrs) {
        $scope.curricula = CurrentUser.curricula.where({user_id: CurrentUser.id});
			}
		}
	}]);
