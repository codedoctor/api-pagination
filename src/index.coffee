###
@author Martin Wawrusch (martin@wawrusch.com)
###

PagingUrlHelper = require './paging-url-helper'
convertToRest = require './convert-to-rest'
parseMyInt = require './parse-my-int'

module.exports =
  pagingUrlHelper: (offset,count,totalCount,url) ->
    return new PagingUrlHelper(offset,count,totalCount,url)

  toRest: (resultData,url) ->
    convertToRest(resultData,url)

  parseInt: (data) -> parseMyInt(data)