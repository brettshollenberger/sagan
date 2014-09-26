angular.module('ngRails').factory('forkService', ['CourseMaterial', function(CourseMaterial) {
	return {
		createFactory: function(file) {
			return file.$fork
		}
	}
	
}]);