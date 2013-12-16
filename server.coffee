#!/usr/bin/env coffee

americano = require 'americano'
init = require './server/init'

port = process.env.PORT || 9875

americano.start name: 'piggybank', port: port, ->
    init ->
        console.log "=> Server intialized!"
