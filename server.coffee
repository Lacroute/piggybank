americano = require 'americano'

port = process.env.PORT || 9875

americano.start name: 'piggybank', port: port, ->
