

module.exports = 
  clientId:  '01234567890123456789000a'
  accountId: '01234567890123456789000b'

  invalidRoleId:'0123456789012345678900aa'

  invalidRole:
    description: "This is a role 1"
    isInternal: false

  role1:
    name: "role1"
    description: "This is a role 1"
    isInternal: false

  role2:
    name: "role2"
    description: "This is a role 2"
    isInternal: false

  roleInternal1:
    name: "role3"
    description: "This is a role 3"
    isInternal: true


  credentialsUser:
    id: "13a88c31413019245de27da7"
    username: 'Martin Wawrusch'
    accountId: '13a88c31413019245de27da0'
    roles: []

  credentialsServerAdmin:
    id: "13a88c31413019245de27da0"
    username: 'John Smith'
    accountId: '13a88c31413019245de27da0'
    roles: []
    scopes: ['server-admin']
