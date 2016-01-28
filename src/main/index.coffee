require('insert-css')(require './index.styl')
Component = require 'component'

module.exports =
Main = ->
    component = Component()

    component.render = ->
        el = document.createDocumentFragment()

        hello = document.createElement 'div'
        hello.classList.add 'main'
        hello.textContent = "Wee! - I'm flying without wings!"

        el.appendChild hello

        el

    component
