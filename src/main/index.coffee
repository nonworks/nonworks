require('insert-css')(require './index.styl')
{div} = require 'elements'

Component = require 'component'

module.exports =
Main = ->
    component = Component()

    # Public
    component.getEl = -> el

    # Private

    # Constructor
    el = document.createDocumentFragment()

    hello = div 'main', textContent: "Wee! - I'm flying without wings!"
    el.appendChild hello

    # Binding

    component
