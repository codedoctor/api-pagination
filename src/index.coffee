###
@author Martin Wawrusch (martin@wawrusch.com)
###

PagingUrlHelper = require './paging-url-helper'

module.exports.pagingUrlHelper = (offset,count,totalCount,url) ->
  return new PagingUrlHelper(offset,count,totalCount,url)