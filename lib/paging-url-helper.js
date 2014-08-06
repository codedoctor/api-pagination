(function() {
  var PagingUrlHelper, url, _,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  _ = require('underscore');

  url = require('url');

  module.exports = PagingUrlHelper = (function() {
    function PagingUrlHelper(requestOffset, requestCount, totalCount, requestUrl) {
      this.requestOffset = requestOffset;
      this.requestCount = requestCount;
      this.totalCount = totalCount;
      this.requestUrl = requestUrl;
      this.pages = __bind(this.pages, this);
      this.previous = __bind(this.previous, this);
      this.next = __bind(this.next, this);
      this.last = __bind(this.last, this);
      this.first = __bind(this.first, this);
      this._lastPage = __bind(this._lastPage, this);
      this._numberOfPages = __bind(this._numberOfPages, this);
      this._makeUrl = __bind(this._makeUrl, this);
      this._currentPage = __bind(this._currentPage, this);
    }

    PagingUrlHelper.prototype._currentPage = function() {
      return Math.floor(this.requestOffset / this.requestCount);
    };

    PagingUrlHelper.prototype._makeUrl = function(newOffset, newCount) {
      var rurl;
      rurl = url.parse(url.format(this.requestUrl), true);
      rurl.search = null;
      rurl.query.offset = newOffset;
      rurl.query.count = newCount;
      return url.format(rurl);
    };

    PagingUrlHelper.prototype._numberOfPages = function() {
      return Math.floor((this.totalCount - 1) / this.requestCount) + 1;
    };

    PagingUrlHelper.prototype._lastPage = function() {
      return this._numberOfPages() - 1;
    };

    PagingUrlHelper.prototype.first = function() {
      if (this.totalCount === 0) {
        return null;
      }
      return this._makeUrl(0, this.requestCount);
    };

    PagingUrlHelper.prototype.last = function() {
      var lastPageOffset;
      if (this.totalCount === 0) {
        return null;
      }
      lastPageOffset = this._lastPage() * this.requestCount;
      return this._makeUrl(lastPageOffset, this.requestCount);
    };

    PagingUrlHelper.prototype.next = function() {
      var nextPage;
      nextPage = this._currentPage() + 1;
      if (nextPage > this._lastPage() || this.totalCount === 0) {
        return null;
      }
      return this._makeUrl(nextPage * this.requestCount, this.requestCount);
    };

    PagingUrlHelper.prototype.previous = function() {
      var nextPage;
      nextPage = this._currentPage() - 1;
      if (nextPage < 0 || this.totalCount === 0) {
        return null;
      }
      return this._makeUrl(nextPage * this.requestCount, this.requestCount);
    };

    PagingUrlHelper.prototype.pages = function() {
      var createEntry, endIndex, page, pageNumber, result, startIndex, _i, _j, _ref;
      if (this._numberOfPages() < 1) {
        return [];
      }
      createEntry = (function(_this) {
        return function(pageNumber) {
          var x;
          x = {
            kind: 'page',
            pageNumber: pageNumber,
            pageNumberDisplay: (pageNumber + 1).toString(),
            url: _this._makeUrl(pageNumber * _this.requestCount, _this.requestCount)
          };
          if (pageNumber === _this._currentPage()) {
            x.active = true;
          }
          return x;
        };
      })(this);
      result = [];
      if (this._numberOfPages() <= 9) {
        for (pageNumber = _i = 0, _ref = this._numberOfPages() - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; pageNumber = 0 <= _ref ? ++_i : --_i) {
          result.push(createEntry(pageNumber));
        }
      } else {
        result.push(createEntry(0));
        startIndex = this._currentPage() - 3;
        if (startIndex < 1) {
          startIndex = 1;
        }
        if (startIndex > 1) {
          result.push({
            kind: 'separator'
          });
        }
        endIndex = startIndex + 6;
        if (endIndex >= this.lastPage()) {
          endIndex = this.lastPage - 1;
        }
        for (page = _j = startIndex; startIndex <= endIndex ? _j <= endIndex : _j >= endIndex; page = startIndex <= endIndex ? ++_j : --_j) {
          result.push(createEntry(page));
        }
        if (endIndex < this.lastPage() - 1) {
          result.push({
            kind: 'separator'
          });
        }
        result.push(createEntry(this._lastPage()));
      }
      return result;
    };

    return PagingUrlHelper;

  })();

}).call(this);

//# sourceMappingURL=paging-url-helper.js.map
