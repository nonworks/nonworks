Event = require 'event'
extend = require 'extend'

module.exports =
Component = ->
    component = extend {}, Event()

    component.mixin = (otherObj) ->
        extend component, otherObj

    component
