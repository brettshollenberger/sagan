angular
	.module('ngRails')
	.directive('myCurricula', ['CurrentUser', 'CurrentCurriculum', 'Curriculum', function(CurrentUser, CurrentCurriculum, Curriculum) {
		return {
			scope: {
      },
			templateUrl: 'directives/my_curricula.html',
			link: function($scope, el, attrs) {

				$scope.newCurriculum = {};
				$scope.isAdding = false;
				
				$scope.toggleAdding = function() {
					$scope.isAdding = !$scope.isAdding;
				}

				$scope.createCurriculum = function() {
					var newCurriculum = Curriculum.new({ name: $scope.newCurriculum.name});
					newCurriculum.$save().then(function() {
						$scope.curricula.push(newCurriculum);
						$scope.isAdding = false;
					});
				}

				$scope.$watch(function () { return CurrentCurriculum.getCurriculum(); }, function (newValue) {
			        if (newValue) $scope.currentCurriculum = newValue;
			    });
        		$scope.curricula = CurrentUser.curricula.where({user_id: CurrentUser.id});
			}
		}
	}]);
