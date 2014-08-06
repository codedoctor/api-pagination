async = require 'async'
mongoose = require 'mongoose'

collections = [
  'identitymt.roles'
  'identitymt.oauthapps'
  'identitymt.oauthaccesstokens'
]

module.exports = (loggingEnabled,cb) ->
  if loggingEnabled
    console.log "" 
    console.log "CLEANING database"

  removeCollection = (name,cb) ->
      #@mongo.collection(name).dropIndexes  (err) =>
      #console.log "COMPLETED DROP INDEXES ON #{name} ERR: #{err}"
      # NOTE: Drop Indexes reports errors on collections that don't exist...
      mongoose.connection.collection(name).remove {}, cb

  async.eachSeries collections ,removeCollection, (err) ->
    if err
      console.log "CLEANING database ERROR: #{err.message}"
    else
      console.log "CLEANING database COMPLETE" if loggingEnabled
    cb err
