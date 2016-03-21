require('insert-css')(require('./index.styl'))
{elem, div} = require 'elements'

Component = require 'component'
Text = require '../text'

module.exports =
EditableLabel = ({text=''}={}) ->
    component = Component()

    # Public
    component.mixin {
        getEl: -> el
        getText: -> text.getText()

        setText: (newText) ->
            labelEl.textContent = newText
            text.setText(newText)
    }

    # Private
    hideInput = -> textEl.style.display = 'none'
    showInput = -> textEl.style.display = 'block'

    # Constructor
    defaultText = text
    text = Text()

    el = div 'editable-label'

    el.appendChild labelEl = div 'editable-label-text'
    el.appendChild textEl = text.render()

    component.setText defaultText

    # Binding
    component.registerEvents 'change'

    labelEl.addEventListener 'click', (e) ->
        e.stopPropagation?()
        showInput()
        text.setFocus()

    text.on 'submit', ->
        component.setText text.getText()
        hideInput()
        component.trigger 'change'

    hideInput()

    component
