angular
  .module('ngRails', ['ng', 'ngRoute', 'ngActiveResource'])

  .config(function ($routeProvider) {

    $routeProvider

      .when('/', {
        templateUrl: 'views/discover.html',
        controller: 'AppCtrl'
      })

      .when('/curricula/:id', {
        templateUrl: 'views/curricula/show.html',
        controller: 'CurriculaShowCtrl'
      })

      .when('/course_materials/:id', {
        templateUrl: 'views/course_materials/show.html',
        controller: 'CourseMaterialsShowCtrl'
      })

      .when('/files/:id/course_materials/new', {
        templateUrl: 'views/course_materials/new.html',
        controller: 'CourseMaterialsNewCtrl'
      })

      .otherwise({
        redirectTo: '/'
      });

  })

  .run(['ngActiveResource', function(ngActiveResource) {

    ngActiveResource.api.configure(function(config) {
      config.baseURL = "http://localhost:3000/api";
    });

  }]);
