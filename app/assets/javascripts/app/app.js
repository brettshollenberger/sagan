angular
  .module('ngRails', ['ng', 'ngRoute', 'ngActiveResource'])

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

      .otherwise({
        redirectTo: '/'
      });

  })

  .run(['ngActiveResource', function(ngActiveResource) {

    ngActiveResource.api.configure(function(config) {
      config.baseURL = "http://localhost:3000/api";
    });

  }]);
