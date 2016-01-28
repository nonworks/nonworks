Event = require 'event'
extend = require 'extend'

module.exports =
Component = ->
    shared = extend {}, Event()
