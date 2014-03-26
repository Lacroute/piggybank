index = require './index'

module.exports =
    '' :
        get: index.home
    'public/bankaccount':
        get: index.listAccount
    'public/:id_account/operation':
        get: index.listOperation