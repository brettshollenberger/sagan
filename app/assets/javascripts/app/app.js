angular
  .module('ngRails', ['ng', 'ngRoute', 'ngActiveResource', 'ngAnimate'])

  .config(function ($routeProvider) {

    $routeProvider

      .when('/', {
        templateUrl: 'views/discover.html',
        controller: 'AppCtrl'
      })

      .when('/curricula/:id', {
        templateUrl: 'views/curricula/index.html',
        controller: 'AppCtrl'
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
