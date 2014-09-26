angular
	.module('ngRails')
	.directive('fileInTree', ['CurrentUser', function(CurrentUser) {
		return {
			scope: {
        file: '=fileInTree'
      },
			templateUrl: 'directives/file_in_tree.html'
		}
	}]);
