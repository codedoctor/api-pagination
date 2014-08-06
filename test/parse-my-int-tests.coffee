should = require 'should'
parseMyInt = require '../lib/parse-my-int'
_ = require 'underscore'

fnParseAndCompare = (input,expected,cb) ->
    res = parseMyInt(input)
    should.exist res
    res.should.be.equal expected
    cb?(null)


describe 'testing parseMyInt', ->
  it 'should parse 0', (cb) ->
    fnParseAndCompare 0,0, cb

  it 'should parse "0"', (cb) ->
    fnParseAndCompare "0",0, cb

  it 'should parse "-1" and return 0', (cb) ->
    fnParseAndCompare "-1",0, cb

  it 'should parse -1 and return 0', (cb) ->
    fnParseAndCompare -1,0, cb

  it 'should parse 9 and return 9', (cb) ->
    fnParseAndCompare 9,9, cb

  it 'should parse "9" and return 9', (cb) ->
    fnParseAndCompare "9",9, cb

  it 'should parse "009" and return 9', (cb) ->
    fnParseAndCompare "009",9, cb


  it 'should parse "18sedd" and return 18', (cb) ->
    fnParseAndCompare "18sedd",18, cb
