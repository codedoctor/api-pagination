should = require 'should'
convertToRest = require '../lib/convert-to-rest'
fixtures = require './support/fixtures'
_ = require 'underscore'


describe 'testing convertToRest', ->
  describe 'when request 20 offset 0 total 0 records', ->
    r = convertToRest fixtures.resultData20request0offset0total(), fixtures.urlWithQS()

    it 'should have a clean root', (cb) ->
      should.exist r
      r.should.have.property 'items'
      r.items.should.be.an.Array.length(0)
      r.should.not.have.property 'requestCount'
      r.should.not.have.property 'requestOffset'
      r.should.not.have.property 'totalCount'
      cb null

    it 'should have pagination', (cb) ->
      r.should.have.property '_pagination'
      p = r._pagination

      p.should.have.property 'totalCount', 0
      p.should.have.property 'requestCount', 20
      p.should.have.property 'requestOffset', 0
      p.should.have.property 'requestPageNumber', 0
      p.should.have.property 'requestPageNumberDisplay', '1'
      p.should.have.property 'totalPageCount', 0
      p.should.have.property 'pagingKind', 'paged'
      cb null

    it 'should have no navigation urls', (cb) ->
      p = r._pagination

      p.should.have.property 'previousUrl', null
      p.should.have.property 'nextUrl', null
      p.should.have.property 'firstUrl', null
      p.should.have.property 'lastUrl', null
      cb null

    it 'should have 0 pages', (cb) ->
      p = r._pagination
      p.should.have.property 'pages'
      p.pages.should.be.an.Array.length(0)

      console.log JSON.stringify r
      cb null
      ###
      "pages":[  
         {  
            "kind":"page",
            "pageNumber":0,
            "pageNumberDisplay":"1",
            "url":"http://www.hello.com:8012/my/rest",
            "active":true
         }
      ]
      ###

  describe 'when request 20 offset 0 total 1 records', ->
    r = convertToRest fixtures.resultData20request0offset1total(), fixtures.urlWithQS()

    it 'should have a clean root', (cb) ->
      should.exist r
      r.should.have.property 'items'
      r.items.should.be.an.Array.length(1)
      r.should.not.have.property 'requestCount'
      r.should.not.have.property 'requestOffset'
      r.should.not.have.property 'totalCount'
      cb null

    it 'should have pagination', (cb) ->
      r.should.have.property '_pagination'
      p = r._pagination

      p.should.have.property 'totalCount', 1
      p.should.have.property 'requestCount', 20
      p.should.have.property 'requestOffset', 0
      p.should.have.property 'requestPageNumber', 0
      p.should.have.property 'requestPageNumberDisplay', '1'
      p.should.have.property 'totalPageCount', 1
      p.should.have.property 'pagingKind', 'paged'
      cb null

    it 'should have no navigation urls', (cb) ->
      p = r._pagination
      p.should.have.property 'previousUrl', null
      p.should.have.property 'nextUrl', null
      p.should.have.property 'firstUrl','http://www.hello.com:8012/my/rest?a=12&b=ss&offset=0&count=20'
      p.should.have.property 'lastUrl','http://www.hello.com:8012/my/rest?a=12&b=ss&offset=0&count=20'
      cb null

    it 'should have 1 pages', (cb) ->
      console.log JSON.stringify r
      p = r._pagination
      p.should.have.property 'pages'
      p.pages.should.be.an.Array.length(1)
      page1 = p.pages[0]
      should.exist page1
      page1.should.have.property 'kind','page'
      page1.should.have.property 'pageNumber',0
      page1.should.have.property 'pageNumberDisplay',"1"
      page1.should.have.property 'active',true
      page1.should.have.property 'url','http://www.hello.com:8012/my/rest?a=12&b=ss&offset=0&count=20'

      cb null


###
{  
   "items":[  
      "a"
   ],
   "_pagination":{  
      "totalCount":1,
      "requestCount":20,
      "requestOffset":0,
      "requestPageNumber":0,
      "requestPageNumberDisplay":"1",
      "totalPageCount":1,
      "pagingKind":"paged",
      "previousUrl":null,
      "nextUrl":null,
      "firstUrl":"http://www.hello.com:8012/my/rest",
      "lastUrl":"http://www.hello.com:8012/my/rest",
      "pages":[  
         {  
            "kind":"page",
            "pageNumber":0,
            "pageNumberDisplay":"1",
            "url":"http://www.hello.com:8012/my/rest",
            "active":true
         }
      ]
   }
}
###


