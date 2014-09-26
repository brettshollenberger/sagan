angular
  .module('ngRails')
  .directive('fileTree', ['ARMixin', 'ARFunctional.Collection', 'CurrentCurriculum', 'forkService', function(mixin, FunctionalCollection, CurrentCurriculum, forkService) {
    return {
      scope: {
        source: "="
      },
      templateUrl: 'directives/file_tree.html',
      controller: function($scope, $element) {
        console.log($scope.appendSource);
      },
      link: function(scope, element, attributes) {
        scope.breadcrumbs = mixin([scope.source], FunctionalCollection);
        CurrentCurriculum.setCurriculum(scope.breadcrumbs[0]);

        scope.forkItem = function(childNode) {
          forkService.createFork(childNode);
        }

        scope.appendSource = function(newSource) {
          scope.source = newSource;
          scope.source.course_materials.findAll();
          scope.breadcrumbs.push(newSource);
          CurrentCurriculum.setCurriculum(scope.breadcrumbs[0]);
        }

        scope.navigateTo = function(newSource) {
          var navigateToIndex = _.findIndex(scope.breadcrumbs, newSource);

          // Navigate back to a particular index
          for (var i = navigateToIndex; i < scope.breadcrumbs.length; i++) {
            scope.breadcrumbs[i] = undefined;
          }

          scope.breadcrumbs.$compact();

          scope.source = newSource;
          scope.breadcrumbs.push(newSource);
          CurrentCurriculum.setCurriculum(scope.breadcrumbs[0]);
        }
      }
    }

  }]);
