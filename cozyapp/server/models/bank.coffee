americano = require 'americano'

module.exports = bank = americano.getModel 'bank',
    name: String
    uuid: String

bank.all = (callback) ->
    bank.request "all", callback