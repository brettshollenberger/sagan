angular
  .module('ngRails')
  .controller('AppCtrl', ['$scope', '$rootScope', 'User', 'Curriculum', 'ARFunctional.Collection',
  'ARMixin',
  function($scope, $rootScope, User, Curriculum, FunctionalCollection, mixin) {

    $scope.current_user = User.find("me").then(function() {
      $scope.curricula = Curriculum.where({owner_id: $scope.current_user.id}).then(function() {
        $rootScope.currentRoot    = $scope.curricula.first();
        $rootScope.currentContent = $scope.currentRoot;
        $rootScope.breadcrumbs    = mixin([$rootScope.currentRoot], FunctionalCollection);

        $scope.setContent = function(newContent) {
          var oldContent = $rootScope.currentContent;
          $rootScope.currentContent = newContent;

          if (_.include(oldContent.course_materials, newContent)) {
            $rootScope.breadcrumbs.push(newContent);
          } else {
            $scope.navigateTo(newContent);
          }
        }

        $scope.navigateTo = function(newContent) {
          var navigateToIndex = _.findIndex($rootScope.breadcrumbs, newContent);

          // If not navigating back to a particular index, navigate up one
          if (navigateToIndex == -1) {
            $rootScope.breadcrumbs.pop();
          } else {
          // Navigate back to a particular index
            for (var i = navigateToIndex; i < $rootScope.breadcrumbs.length; i++) {
              $rootScope.breadcrumbs[i] = undefined;
            }

            $rootScope.breadcrumbs.$compact();
          }

          $rootScope.currentContent = newContent;
          $rootScope.breadcrumbs.push(newContent);
        }
      });
    });
  }]);
