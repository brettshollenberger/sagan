angular.module('ngRails').factory('AppService', function() {
	var data = {
        curriculum: undefined
    };

    return {
        getCurriculum: function () {
            return data.curriculum;
        },
        setCurriculum: function (newCurriculum) {
            data.curriculum = newCurriculum;
        }
    };
});