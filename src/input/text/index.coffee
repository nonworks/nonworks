require('insert-css')(require('./index.styl'))
Component = require 'component'
elem = require 'elements'
div = elem.div

module.exports =
Text = ({placeholder}) ->
    shared = Component()
    input= null

    shared.render = ->
        el = div 'input'

        input = elem 'input'
        input.setAttribute 'placeholder', (placeholder or '')
        input.addEventListener 'keyup', ->
            if shared.getText().length > 0
                cross.style.display = 'block'
            else
                cross.style.display = 'none'

        cross = div('input-cross')
        cross.addEventListener 'click', ->
            input.value = ''
        cross.style.display = 'none'

        el.appendChild input
        el.appendChild cross

        el

    shared.getText = ->
        input.value

    shared
