angular
	.module('ngRails')
	.controller('DiscoverCtrl', ['$scope', 'Curriculum', function($scope, Curriculum) {
		$scope.curricula = Curriculum.findAll();
}]);