{div} = require 'elements'

Component = require 'component'
Text = require 'input/text'
Button = require 'input/button'

module.exports =
Form = ({fields, submit}) ->
    component = Component()

    # Public
    component.getEl = -> el

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

    for k,v of fields
        text = inputs[k] = Text(v)
        if v.type == 'password'
            text.clear = true
        el.appendChild inputs[k].getEl()

    button = Button(label: submit)
    el.appendChild button.getEl()

    # Binding
    component.registerEvents 'send'

    button.on 'click', ->
        send()

    component
