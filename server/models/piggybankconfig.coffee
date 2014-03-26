americano = require 'americano'

module.exports = piggy_bank_config = americano.getModel 'piggybankconfig',
    password: String

piggy_bank_config.getConfig = (callback) ->
    piggy_bank_config.request "all", (err, docs) ->
      if err?
        callback err
      else if docs.length is 0
        callback null, false
      else
        callback null, docs[0]