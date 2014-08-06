should = require 'should'
_ = require 'underscore'
fixtures = require './support/fixtures'

describe 'paging url helper', ->
  puh = require '../lib/paging-url-helper'

  it 'should not be null', ->
    should.exist puh

  describe '0 offset 20 request  total', ->
    pg = new puh(0,20,0,fixtures.urlWithQS())
    describe 'pp.previous()', ->
      x = pg.previous()
      it 'should exist', ->
        should.not.exist x

  describe '0 offset 20 request  1 total', ->
    pg = new puh(0,20,1,fixtures.urlWithQS())
    describe 'pp.previous()', ->
      x = pg.previous()

      it 'should exist', ->
        should.not.exist x

  describe '0 offset 20 request 19 total', ->
    pg = new puh(0,20,19,fixtures.urlWithQS())
    describe 'pp.previous()', ->
      x = pg.previous()

      it 'should exist', ->
        should.not.exist x

  describe '20 offset 20 request 26 total', ->
    pg = new puh(20,20,26,fixtures.urlWithQS())
    describe 'pp.previous()', ->
      x = pg.previous()

      it 'should exist', ->
        should.exist x
