angular
	.module('ngRails')
	.directive('fileInTree', ['CurrentUser', function(CurrentUser) {
		return {
			scope: {
		        file: '=fileInTree',
		        appendChild: '&',
		        forkItem: '&'
		      },
			templateUrl: 'directives/file_in_tree.html',
			link: function(scope, el, attrs) {

			}
		}
	}]);
