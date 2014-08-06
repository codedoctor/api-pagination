module.exports = parseMyInt = (someValue, def = 0) ->
  try
    x = parseInt((someValue || def).toString(), 10)
    x = 0 if x < 0
    return x
  catch e
    return def
