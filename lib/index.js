
/*
@author Martin Wawrusch (martin@wawrusch.com)
 */

(function() {
  var PagingUrlHelper, convertToRest;

  PagingUrlHelper = require('./paging-url-helper');

  convertToRest = require('./convert-to-rest');

  module.exports = {
    pagingUrlHelper: function(offset, count, totalCount, url) {
      return new PagingUrlHelper(offset, count, totalCount, url);
    },
    toRest: function(resultData, url) {
      return convertToRest(resultData, url);
    }
  };

}).call(this);

//# sourceMappingURL=index.js.map
