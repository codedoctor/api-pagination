_ = require 'underscore'
url = require 'url'


module.exports = class PagingUrlHelper
  constructor: (@requestOffset,@requestCount,@totalCount,@requestUrl) ->

  _currentPage: () =>
    Math.floor(@requestOffset / @requestCount)

  _makeUrl: (newOffset,newCount) =>
    rurl = url.parse(url.format(@requestUrl),true)

    rurl.search = null # IMPORTANT

    rurl.query.offset = newOffset
    rurl.query.count = newCount
    url.format(rurl)

  _numberOfPages: =>
    Math.floor((@totalCount - 1) / @requestCount) + 1

  _lastPage: =>
    @_numberOfPages() - 1

  first: =>
    return null if @totalCount is 0
    @_makeUrl 0, @requestCount

  last: =>
    return null if @totalCount is 0
    lastPageOffset = @_lastPage() * @requestCount 
    #lastPageOffset = lastPageOffset - 1 if lastPageOffset is @totalCount
    @_makeUrl lastPageOffset, @requestCount

  next: =>
    nextPage = @_currentPage() + 1
    return null if nextPage > @_lastPage() or @totalCount is 0
    @_makeUrl nextPage * @requestCount, @requestCount


  previous: =>
    nextPage = @_currentPage() - 1
    return null if nextPage < 0 or @totalCount is 0
    @_makeUrl nextPage * @requestCount, @requestCount

  pages: =>
    return [] if @_numberOfPages() < 1

    createEntry = (pageNumber) =>
      x = 
        kind: 'page'
        pageNumber: pageNumber
        pageNumberDisplay: (pageNumber + 1).toString()
        url: @_makeUrl pageNumber * @requestCount, @requestCount

      x.active = true if pageNumber is @_currentPage()

      return x

    result = []

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
      endIndex = @_lastPage() - 1 if endIndex >= @_lastPage()

      for page in [startIndex .. endIndex]
        result.push createEntry(page)

      result.push kind : 'separator' if endIndex < @_lastPage() - 1 # add a separator

      # Add last page
      result.push createEntry(@_lastPage())

    result

