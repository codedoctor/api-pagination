Hoek = require 'hoek'
PagingUrlHelper = require './paging-url-helper'

###
Augments (and returns) a resultData object with pagination information.
###
module.exports = (resultData,url) =>
  Hoek.assert resultData,"A resultData object is required (with requestCount,requestOffset,totalCount,items)"
  Hoek.assert url, "An url parameter is required (node.js url object)"

  resultData.items ||= [] 

  pp = new PagingUrlHelper(resultData.requestOffset,resultData.requestCount,resultData.totalCount,url)

  resultData._pagination =
    totalCount : resultData.totalCount
    requestCount : resultData.requestCount
    requestOffset: resultData.requestOffset
    requestPageNumber: pp._currentPage()
    requestPageNumberDisplay: (pp._currentPage() + 1).toString()
    totalPageCount: pp._numberOfPages()
    pagingKind: "paged"
    previousUrl: pp.previous()
    nextUrl: pp.next()
    firstUrl: pp.first()
    lastUrl: pp.last()
    pages: pp.pages() 
  delete resultData.base
  delete resultData.baseUrl
  delete resultData.totalCount
  delete resultData.requestCount
  delete resultData.requestOffset
  return resultData
