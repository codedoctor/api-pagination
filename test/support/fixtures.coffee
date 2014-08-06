url = require 'url'

module.exports =
  urlWithQS: -> url.parse "http://www.hello.com:8012/my/rest?a=12&b=ss"


  resultData20request0offset0total: ->
    items: []
    requestCount: 20
    requestOffset: 0
    totalCount: 0
  resultData20request0offset1total: ->
    items: [
      'a'
    ]
    requestCount: 20
    requestOffset: 0
    totalCount: 1

  resultData20request60offset205total: ->
    items: [
      'a','b','c','d','e','f','g','h','l','m'
      'a','b','c','d','e','f','g','h','l','m'
    ]
    requestCount: 20
    requestOffset: 60
    totalCount: 205

