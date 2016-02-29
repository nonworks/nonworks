require('insert-css')(require('./index.styl'))
Component = require 'component'
{elem, div} = require 'elements'

module.exports =
Text = ({placeholder=''}={}) ->
    component = Component()
    input= null
    cross = undefined

    component.registerEvents 'submit'

    updateCross = ->
        if component.getText().length > 0
            cross.style.display = 'block'
        else
            cross.style.display = 'none'

    component.render = ->
        el = div 'input'

        input = elem 'input'
        input.setAttribute 'placeholder', (placeholder or '')
        input.addEventListener 'keyup', (e) ->
            if e.which == 13 or e.keyCode == 13
                component.trigger 'submit'
            updateCross()

        input.addEventListener 'click', (e) ->
            e.stopPropagation()

        cross = div('input-cross')
        cross.addEventListener 'click', (e) ->
            input.value = ''
            e.stopPropagation()
        cross.style.display = 'none'

        el.appendChild input
        el.appendChild cross

        el

    component.setPlaceholder = (text) ->
        input.setAttribute 'placeholder', text

    component.getText = ->
        input.value

    component.setText = (newText) ->
        input.value = newText
        updateCross()

    component.setFocus = ->
        input.focus()

    component
