require('insert-css')(require('./index.styl'))
Component = require 'component'
{elem, div} = require 'elements'

module.exports =
Text = ({placeholder=''}={}) ->
    component = Component()

    # Public
    component.mixin {
        getEl: -> el

        setPlaceholder: (text) ->
            input.setAttribute 'placeholder', text

        getText: ->
            input.value

        setText: (newText) ->
            input.value = newText
            updateCross()

        setFocus: ->
            input.focus()
    }

    # Private
    updateCross = ->
        if component.getText().length > 0
            cross.style.display = 'block'
        else
            cross.style.display = 'none'

    # Constructor
    el = div 'input'

    input = elem 'input', placeholder: placeholder
    cross = div 'input-cross'
    cross.style.display = 'none'

    el.appendChild input
    el.appendChild cross

    # Binding
    component.registerEvents 'submit'

    input.addEventListener 'keyup', (e) ->
        if e.which == 13 or e.keyCode == 13
            component.trigger 'submit'
        updateCross()

    input.addEventListener 'click', (e) ->
        e.stopPropagation()

    cross.addEventListener 'click', (e) ->
        input.value = ''
        e.stopPropagation()

    component
