angular
  .module('ngRails')
  .controller('CurriculaIndexCtrl', ['$scope', '$rootScope',
  function($scope, $rootScope) {

    $rootScope.$watch('currentContent', function() {
      if (!_.isUndefined($rootScope.currentContent)) {
        $rootScope.currentContent.course_materials.findAll();
      }
    });

  }]);
