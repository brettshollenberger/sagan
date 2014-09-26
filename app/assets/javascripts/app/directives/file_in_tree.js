angular
	.module('ngRails')
	.directive('fileInTree', ['forkService', function(forkService) {
		return {
			scope: {
		        file: '=fileInTree',
		        appendChild: '&'
		      },
			templateUrl: 'directives/file_in_tree.html',
			link: function(scope, el, attrs) {
				scope.forkItem = function() {
					var derp = forkService.createFork(scope.file);
					console.log(derp);
				}
			}
		}
	}]);
