angular
	.module('ngRails')
	.directive('courseMaterial', function() {
		return {
			restrict: "AE",
			scope: "=",
			templateUrl: 'directives/course_material.html'
		}
	});