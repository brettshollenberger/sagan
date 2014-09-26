angular
  .module('ngRails')
  .controller('AppCtrl', ['$scope', '$rootScope', 'User', 'Curriculum', 'ARFunctional.Collection',
  'ARMixin',
  function($scope, $rootScope, User, Curriculum, FunctionalCollection, mixin) {

    $scope.current_user = User.find("me").then(function() {
      $scope.curricula = Curriculum.where({owner_id: $scope.current_user.id}).then(function() {
        $rootScope.currentRoot = $scope.curricula.first();
        $rootScope.currentContent = $scope.currentRoot;
        $rootScope.breadcrumbs = mixin([$rootScope.currentRoot], FunctionalCollection);

        $scope.setContent = function(newContent) {
          $rootScope.currentContent = newContent;
          $rootScope.breadcrumbs.push(newContent);
        }

        $scope.setRoot = function(newRoot) {
          $rootScope.currentRoot = newRoot;
          $rootScope.breadcrumbs.$removeAll();
          console.log($rootScope.currentRoot);
        }

        $scope.navigateTo = function(newContent) {
          var navigateToIndex = _.findIndex($rootScope.breadcrumbs, newContent);

          for (var i = navigateToIndex; i < $rootScope.breadcrumbs.length; i++) {
            $rootScope.breadcrumbs[i] = undefined;
          }

          $rootScope.breadcrumbs.$compact();

          $scope.setContent(newContent);
        }
      });
    });
  }]);
