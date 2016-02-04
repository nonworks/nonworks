require('insert-css')(require('./index.styl'))
Component = require 'component'
{elem, div} = require 'elements'

module.exports =
Text = ({placeholder=''}={}) ->
    shared = Component()
    input= null
    cross = undefined

    updateCross = ->
        if shared.getText().length > 0
            cross.style.display = 'block'
        else
            cross.style.display = 'none'

    shared.render = ->
        el = div 'input'

        input = elem 'input'
        input.setAttribute 'placeholder', (placeholder or '')
        input.addEventListener 'keyup', ->
            updateCross()

        cross = div('input-cross')
        cross.addEventListener 'click', ->
            input.value = ''
        cross.style.display = 'none'

        el.appendChild input
        el.appendChild cross

        el

    shared.getText = ->
        input.value

    shared.setText = (newText) ->
        input.value = newText
        updateCross()

    shared
