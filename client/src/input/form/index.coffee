{div} = require 'elements'

Component = require 'component'
Text = require 'input/text'
TextArea = require 'input/textarea'
Button = require 'input/button'

module.exports =
Form = ({fields, submit}) ->
    component = Component()

    # Public
    component.getEl = -> el

    component.update = (data) ->
        for k,v of data
            inputs[k].setText(v)

    # Private
    send = ->
        data = {}
        for k,v of fields
            data[k] = inputs[k].getText()
            if inputs[k].clear
                inputs[k].setText ''
        component.trigger 'send', data

    # Constructor
    el = div 'form'
    inputs = {}
    lastInput = undefined

    for k,v of fields
        klass = if v.type == 'textarea'
            TextArea
        else
            Text
        text = lastInput = inputs[k] = klass(v)
        if v.type == 'password'
            text.clear = true
        el.appendChild inputs[k].getEl()

    button = Button(label: submit)
    el.appendChild button.getEl()

    # Binding
    component.registerEvents 'send'

    button.on 'click', ->
        send()

    lastInput.on 'submit', ->
        send()

    component
