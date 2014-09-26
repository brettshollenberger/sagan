angular
	.module('ngRails')
	.directive('courseMaterial', function() {
		return {
			restrict: "AE",
			scope: "=",
			templateUrl: 'directives/course_material.html',
			link: function($scope, el, attrs) {
				$scope.toggleFork = function() {
					$(el).toggleClass('fork-visible');
				}
			}
		}
	});