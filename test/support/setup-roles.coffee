fixtures = require './fixtures'
async = require 'async'
module.exports = (server,cb) ->

  roles = [fixtures.role1,fixtures.role2,fixtures.roleInternal1]
  delete r.id for r in roles

  methods = server.pack.plugins['hapi-identity-store'].methods

  addRole = (roleData,cb) ->
    methods.roles.create fixtures.accountId,roleData,null, (err,role) ->
      return cb err if err
      roleData.id = role._id
      cb null,role

  async.eachSeries roles ,addRole, (err) ->
    cb err
