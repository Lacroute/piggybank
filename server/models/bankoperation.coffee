americano = require 'americano'

module.exports = bank_operation = americano.getModel 'bankoperation',
    bankAccount: String
    title: String
    date: Date
    amount: Number
    raw: String
    dateImport: Date

bank_operation.allFromBankAccountDate = (account, callback) ->
    params =
        startkey: [account + "0"]
        endkey: [account]
        descending: true
    bank_operation.request "allByBankAccountAndDate", params, callback
