require('insert-css')(require('./index.styl'))
Component = require 'component'
Text = require '../text'
{elem, div} = require 'elements'

module.exports =
EditableLabel = ({text=''}={}) ->
    defaultText = text
    component = Component()
    text = Text()
    textEl = undefined
    labelEl = undefined

    component.registerEvents 'change'

    hideInput = ->
        textEl.style.display = 'none'

    showInput = ->
        textEl.style.display = 'block'

    component.render = ->
        el = div 'editable-label'

        el.appendChild labelEl = div 'editable-label-text'
        el.appendChild textEl = text.render()

        component.setText defaultText

        labelEl.addEventListener 'click', (e) ->
            e.stopPropagation?()
            showInput()

        text.on 'submit', ->
            component.setText text.getText()
            hideInput()
            component.trigger 'change'

        hideInput()

        el

    component.getText = text.getText

    component.setText = (newText) ->
        labelEl.textContent = newText
        text.setText(newText)

    component
