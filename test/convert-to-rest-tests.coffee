should = require 'should'
convertToRest = require '../lib/convert-to-rest'
fixtures = require './support/fixtures'
_ = require 'underscore'


describe 'testing convertToRest', ->
  describe 'when request 20 offset 0 total 0 records', ->
    r = convertToRest fixtures.resultData20request0offset0total(), fixtures.urlWithQS()

    it 'should have a clean root', ->
      should.exist r
      r.should.have.property 'items'
      r.items.should.be.an.Array.length(0)
      r.should.not.have.property 'requestCount'
      r.should.not.have.property 'requestOffset'
      r.should.not.have.property 'totalCount'

    it 'should have pagination', ->
      r.should.have.property '_pagination'
      p = r._pagination

      p.should.have.property 'totalCount', 0
      p.should.have.property 'requestCount', 20
      p.should.have.property 'requestOffset', 0
      p.should.have.property 'requestPageNumber', 0
      p.should.have.property 'requestPageNumberDisplay', '1'
      p.should.have.property 'totalPageCount', 0
      p.should.have.property 'pagingKind', 'paged'

    it 'should have no navigation urls', ->
      p = r._pagination

      p.should.have.property 'previousUrl', null
      p.should.have.property 'nextUrl', null
      p.should.have.property 'firstUrl', null
      p.should.have.property 'lastUrl', null

    it 'should have 0 pages',->
      p = r._pagination
      p.should.have.property 'pages'
      p.pages.should.be.an.Array.length(0)

  describe 'when request 20 offset 0 total 1 records', ->
    r = convertToRest fixtures.resultData20request0offset1total(), fixtures.urlWithQS()

    it 'should have a clean root', ->
      should.exist r
      r.should.have.property 'items'
      r.items.should.be.an.Array.length(1)
      r.should.not.have.property 'requestCount'
      r.should.not.have.property 'requestOffset'
      r.should.not.have.property 'totalCount'

    it 'should have pagination', ->
      r.should.have.property '_pagination'
      p = r._pagination

      p.should.have.property 'totalCount', 1
      p.should.have.property 'requestCount', 20
      p.should.have.property 'requestOffset', 0
      p.should.have.property 'requestPageNumber', 0
      p.should.have.property 'requestPageNumberDisplay', '1'
      p.should.have.property 'totalPageCount', 1
      p.should.have.property 'pagingKind', 'paged'

    it 'should have no navigation urls', ->
      p = r._pagination
      p.should.have.property 'previousUrl', null
      p.should.have.property 'nextUrl', null
      p.should.have.property 'firstUrl','http://www.hello.com:8012/my/rest?a=12&b=ss&offset=0&count=20'
      p.should.have.property 'lastUrl','http://www.hello.com:8012/my/rest?a=12&b=ss&offset=0&count=20'

    it 'should have 1 pages', ->
      #console.log JSON.stringify r
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


  describe 'when request 20 offset 60 total 205 records', ->
    r = convertToRest fixtures.resultData20request60offset205total(), fixtures.urlWithQS()

    it 'should have a clean root', ->
      should.exist r
      r.should.have.property 'items'
      r.items.should.be.an.Array.length(20)
      r.should.not.have.property 'requestCount'
      r.should.not.have.property 'requestOffset'
      r.should.not.have.property 'totalCount'

    it 'should have pagination', ->
      r.should.have.property '_pagination'
      p = r._pagination

      p.should.have.property 'totalCount', 205
      p.should.have.property 'requestCount', 20
      p.should.have.property 'requestOffset', 60
      p.should.have.property 'requestPageNumber', 3
      p.should.have.property 'requestPageNumberDisplay', '4'
      p.should.have.property 'totalPageCount', 11
      p.should.have.property 'pagingKind', 'paged'

    it 'should have no navigation urls', ->
      p = r._pagination
      p.should.have.property 'previousUrl', "http://www.hello.com:8012/my/rest?a=12&b=ss&offset=40&count=20"
      p.should.have.property 'nextUrl', "http://www.hello.com:8012/my/rest?a=12&b=ss&offset=80&count=20"
      p.should.have.property 'firstUrl','http://www.hello.com:8012/my/rest?a=12&b=ss&offset=0&count=20'
      p.should.have.property 'lastUrl','http://www.hello.com:8012/my/rest?a=12&b=ss&offset=200&count=20'

    it 'should have 1 pages', ->
      p = r._pagination
      p.should.have.property 'pages'
      p.pages.should.be.an.Array.length(10)

      page1 = p.pages[0]
      should.exist page1
      page1.should.have.property 'kind','page'
      page1.should.have.property 'pageNumber',0
      page1.should.have.property 'pageNumberDisplay',"1"
      page1.should.not.have.property 'active'
      page1.should.have.property 'url','http://www.hello.com:8012/my/rest?a=12&b=ss&offset=0&count=20'


