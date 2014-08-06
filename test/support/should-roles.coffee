should = require 'should'

module.exports =
  isValidUserRole: (role) ->
    role.should.have.property "_url"
    role.should.have.property "name"
    role.should.have.property "description"
    role.should.have.property "id"

    role.should.not.have.property "isInternal"
    role.should.not.have.property "accountId"

  isValidServerAdminRole: (role) ->
    role.should.have.property "_url"
    role.should.have.property "name"
    role.should.have.property "description"
    role.should.have.property "id"

    role.should.have.property "isInternal"
    role.should.have.property "accountId"
