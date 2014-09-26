angular.module('ngRails').filter('directories', function() {
  return function(input) {
    if (_.isUndefined(input)) { return false; }
    return _.select(input, function(file) { return file.filetype && file.filetype == "directory"; });
  };
});
