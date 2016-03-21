require('insert-css')(require('./index.styl'))
Component = require 'component'
{elem, div} = require 'elements'

module.exports =
TextArea = ({placeholder='', type='text'}={}) ->
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

        setFocus: ->
            input.focus()
    }

    # Private

    # Constructor
    el = div 'textarea'

    input = elem 'textarea', placeholder: placeholder

    el.appendChild input

    # Binding
    component.registerEvents 'submit'

    input.addEventListener 'keyup', (e) ->
        if (e.which == 13 or e.keyCode == 13) and e.ctrlKey
            component.trigger 'submit'

    input.addEventListener 'click', (e) ->
        e.stopPropagation()

    component
