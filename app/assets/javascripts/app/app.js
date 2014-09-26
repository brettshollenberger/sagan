angular
  .module('ngRails', ['ng', 'ngRoute', 'ngActiveResource', 'ngAnimate'])

  .config(function ($routeProvider) {

    $routeProvider

      .when('/', {
        templateUrl: 'views/curriculum/index.html',
        controller: 'AppCtrl'
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
