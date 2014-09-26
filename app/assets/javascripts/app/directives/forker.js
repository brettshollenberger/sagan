angular.module('ngRails')
	.directive('forker', function(Curriculum) {
		return {
			replace:true,
			scope: '=',
			restrict: 'AE',
			templateUrl: 'directives/forker.html',
			controller: function($scope, $element) {
				
			},
			link: function($scope, el, attrs) {
				$scope.curricula = Curriculum.findAll().then(function() {
					$scope.curricula.each(function(curriculum) {
						$(el).append(curriculum.name);
					});
				});
			}
		}
	});