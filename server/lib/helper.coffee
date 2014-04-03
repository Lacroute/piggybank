piggy_bank_config = require '../models/piggybankconfig'
random_string     = require 'randomstring'

class helper
  token: null

  getToken: (callback) ->
    if @token?
      callback null, @token
    else
      piggy_bank_config.getConfig (err, config) =>
        if err?
          callback err
        else if config
          @token = config.password
          callback null, @token
        else
          token = random_string.generate 8
          piggy_bank_config.create password: token, (err) =>
            if err?
              callback err
            else
              @token = token
              callback null, @token

  formatOperationData: (result) ->
    formated_result = {}
    operation_array = []
    tmp = {}
    
    for item in result
      tmp.libelleCourt = item.title
      tmp.libelleOperationMediaMicro1 = item.raw
      tmp.montant = item.amount
      tmp.date = item.date
      operation_array.push tmp
      tmp = {}

    formated_result.operationDTOlist = operation_array

    return formated_result

  formatAccountData: (result) ->
    # alias, id, solde,
    formated_result = {}
    account_array = []
    tmp = {}

    for item in result
      tmp.id = item.accountNumber
      tmp.alias = item.title
      tmp.solde = item.initialAmount
      account_array.push tmp
      tmp = {}

    formated_result.compteDTOs = account_array

    return formated_result



module.exports = new helper()