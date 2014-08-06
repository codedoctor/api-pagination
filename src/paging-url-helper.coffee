_ = require 'underscore'
url = require 'url'


module.exports = class PagingUrlHelper
  constructor: (@offset,@count,@totalCount,@url) ->


  _currentPage: () =>
    Math.floor(@offset / @count)

  _makeUrl: (newOffset,newCount) =>
    rurl = @url # should clone
    rurl.search = null # IMPORTANT
    rurl.query.offset = newOffset
    rurl.query.count = newCount
    url.format(rurl)

  _numberOfPages: =>
    Math.floor((@totalCount - 1) / @count) + 1

  _lastPage: =>
    @_numberOfPages() - 1

  first: =>
    @_makeUrl 0, @count

  last: =>
    lastPageOffset = @_lastPage() * @count 
    #lastPageOffset = lastPageOffset - 1 if lastPageOffset is @totalCount
    @_makeUrl lastPageOffset, @count

  next: =>
    nextPage = @_currentPage() + 1
    return null if nextPage > @_lastPage()
    @_makeUrl nextPage * @count, @count


  previous: =>
    nextPage = @_currentPage() - 1
    return null if nextPage < 0
    @_makeUrl nextPage * @count, @count

  pages: =>
    result = []

    createEntry = (pageNumber) =>
      x = 
        kind: 'page'
        pageNumber: pageNumber
        pageNumberDisplay: (pageNumber + 1).toString()
        url: @_makeUrl pageNumber * @count, @count

      x.active = true if pageNumber is @_currentPage()

      return x


    if @_numberOfPages() <= 9
      for pageNumber in [0 .. @_numberOfPages() - 1]
        result.push createEntry(pageNumber)
    else
      # Add first page.
      result.push createEntry(0)

      startIndex = @_currentPage() - 3
      startIndex = 1 if startIndex < 1 # ensure that we start with 2, if necessary
      result.push kind : 'separator' if startIndex > 1 # add a separator

      endIndex = startIndex + 6
      endIndex = @lastPage - 1 if endIndex >= @lastPage()

      for page in [startIndex .. endIndex]
        result.push createEntry(page)

      result.push kind : 'separator' if endIndex < @lastPage() - 1 # add a separator

      # Add last page
      result.push createEntry(@_lastPage())

    result

  convertToRest: (resultData = {}) =>
    pp = this

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
    return resultData
