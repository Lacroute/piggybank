americano = require 'americano'

allByName = (doc) -> emit doc.name, doc
allByTitle = (doc) -> emit doc.title, doc
allByBankAccountAndDate = (doc) -> emit [doc.bankAccount, doc.date], doc

module.exports =
    bank:
      all: allByName

    bankaccount:
      all: allByTitle

    bankoperation:
      allByBankAccountAndDate: allByBankAccountAndDate

    piggybankconfig:
      all: americano.defaultRequests.all
      