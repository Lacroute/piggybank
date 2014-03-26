americano = require 'americano'

module.exports = cozy_instance = americano.getModel 'CozyInstance',
    domain: String
    helpUrl: String
    locale: String

cozy_instance.getInstance = (callback) ->
    cozy_instance.request 'all', (err, instances) ->
        if err
            callback err, null
        else if not(instances? and instances.length > 0)
            callback new Error 'No instance parameters found', null
        else
            callback null, instances[0]