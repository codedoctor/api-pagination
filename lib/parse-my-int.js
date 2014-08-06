(function() {
  var parseMyInt;

  module.exports = parseMyInt = function(someValue, def) {
    var e, x;
    if (def == null) {
      def = 0;
    }
    try {
      x = parseInt((someValue || def).toString(), 10);
      if (x < 0) {
        x = 0;
      }
      return x;
    } catch (_error) {
      e = _error;
      return def;
    }
  };

}).call(this);

//# sourceMappingURL=parse-my-int.js.map
