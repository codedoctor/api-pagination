assert = require 'assert'
should = require 'should'
index = require '../lib/index'
_ = require 'underscore'

describe 'index has been loaded', ->
  it 'it should expose an interface', (cb) ->

    should.exist index

    cb null

