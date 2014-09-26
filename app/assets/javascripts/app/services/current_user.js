angular
  .module('ngRails')
  .factory('CurrentUser', ['User', function(User) {
    var me;

    if (_.isUndefined(me)) {
      me = User.find("me");
    }

    return me;
  }]);
