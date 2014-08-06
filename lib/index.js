
/*
@author Martin Wawrusch (martin@wawrusch.com)
 */

(function() {
  var PagingUrlHelper, convertToRest, parseMyInt;

  PagingUrlHelper = require('./paging-url-helper');

  convertToRest = require('./convert-to-rest');

  parseMyInt = require('./parse-my-int');

  module.exports = {
    pagingUrlHelper: function(offset, count, totalCount, url) {
      return new PagingUrlHelper(offset, count, totalCount, url);
    },
    toRest: function(resultData, url) {
      return convertToRest(resultData, url);
    },
    parseInt: function(someValue, def) {
      if (def == null) {
        def = 0;
      }
      return parseMyInt(someValue, def);
    }
  };

}).call(this);

//# sourceMappingURL=index.js.map
