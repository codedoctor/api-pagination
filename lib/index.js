
/*
@author Martin Wawrusch (martin@wawrusch.com)
 */

(function() {
  var PagingUrlHelper;

  PagingUrlHelper = require('./paging-url-helper');

  module.exports.pagingUrlHelper = function(offset, count, totalCount, url) {
    return new PagingUrlHelper(offset, count, totalCount, url);
  };

}).call(this);

//# sourceMappingURL=index.js.map
