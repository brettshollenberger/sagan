angular
	.module('ngRails')
	.directive('fileViewer', ['CurrentUser', function(CurrentUser) {
		return {
			scope: {
        file: '=fileViewer'
      },
			templateUrl: 'directives/file_viewer.html',
      link: function(scope) {
        scope.classifications = ['assignment', 'quiz', 'reading'];
      }
		}
	}]);
