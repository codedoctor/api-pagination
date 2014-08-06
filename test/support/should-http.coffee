should = require 'should'

module.exports =
  get200PagedEmptyResult: (server,pathWithRoot,credentials,cb) ->
    options =
      method: "GET"
      url: pathWithRoot
      credentials: credentials

    server.inject options, (response) ->
      response.statusCode.should.equal 200
      should.exist response.result
      response.result.should.have.property "totalCount",0

      cb null,response

  get200Paged: (server,pathWithRoot,resultCount,credentials,cb) ->
    options =
      method: "GET"
      url: pathWithRoot
      credentials: credentials

    server.inject options, (response) ->
      response.statusCode.should.equal 200    
      should.exist response.result

      cb null,response

  get: (server,pathWithRoot,credentials,statusCode,cb) ->
    options =
      method: "GET"
      url: pathWithRoot
      credentials: credentials

    server.inject options, (response) ->
      response.statusCode.should.equal statusCode
      cb null,response

  post: (server,pathWithRoot,payload,credentials,statusCode = 200,cb) ->
    options =
      method: "POST"
      credentials: credentials
      payload: payload
      url: pathWithRoot

    server.inject options, (response) ->
      response.statusCode.should.equal statusCode  
      cb null,response

  patch: (server,pathWithRoot,payload,credentials,statusCode = 200,cb) ->
    options =
      method: "PATCH"
      url: pathWithRoot
      credentials : credentials
      payload: payload

    server.inject options, (response) ->
      response.statusCode.should.equal statusCode
      cb null,response
 
  delete: (server,pathWithRoot,credentials,statusCode = 200,cb) ->
    options =
      method: "DELETE"
      url: pathWithRoot
      credentials: credentials

    server.inject options, (response) ->
      response.statusCode.should.equal statusCode
      cb null,response

