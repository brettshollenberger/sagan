angular.module('ngRails')
	.service('CurrentCurriculum', ['$routeParams', 'Curriculum', function($routeParams, Curriculum) {
		var data = {
        	curriculum: undefined
	    };

	    return {
	        getCurriculum: function () {
	            return data.curriculum;
	        },
	        setCurriculum: function (newCurriculum) {
	            data.curriculum = newCurriculum;
	        }
	    };
	}]);