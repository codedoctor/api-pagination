###
@author Martin Wawrusch (martin@wawrusch.com)
###

PagingUrlHelper = require './paging-url-helper'
convertToRest = require './convert-to-rest'

module.exports =
  pagingUrlHelper: (offset,count,totalCount,url) ->
    return new PagingUrlHelper(offset,count,totalCount,url)

  toRest: (resultData,url) ->
    convertToRest(resultData,url)
