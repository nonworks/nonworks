Event = require 'event'
extend = require 'extend'

module.exports =
Store = ->
    component = extend {}, Event()

    component.mixin = (otherObj) ->
        extend component, otherObj

    component.registerEvents 'update'

    component
