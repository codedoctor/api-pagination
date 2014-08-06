should = require 'should'
_ = require 'underscore'
fixtures = require './support/fixtures'

describe '_makeUrl tests', ->
  puh = require '../lib/paging-url-helper'

  describe 'with 0 new offset and 20 count, and url with QS', ->
    originalUrl = fixtures.urlWithQS()
    pg = new puh(0,20,0,originalUrl)
    u = pg._makeUrl(0,20)

    it 'should exists', ->
      should.exist u

    it 'should not be the same object', ->
      u.should.not.exactly originalUrl


    it 'should contain all the source url values', ->
      u.should.be.equal 'http://www.hello.com:8012/my/rest?a=12&b=ss&offset=0&count=20'
