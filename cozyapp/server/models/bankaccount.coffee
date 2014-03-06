americano = require 'americano'

module.exports = bank_account = americano.getModel 'bankaccount',
    bank: String
    bankAccess: String
    title: String
    accountNumber: String
    initialAmount: Number
    lastChecked: Date

bank_account.all = (callback) ->
    bank_account.request "all", callback