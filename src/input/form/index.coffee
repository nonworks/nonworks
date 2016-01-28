Component = require 'component'
{div} = require 'elements'

Text = require 'input/text'
Button = require 'input/button'

module.exports =
Form = ({fields, submit}) ->
    shared = Component()
    shared.registerEvents 'send'

    inputs = {}

    shared.render = ->
        el = div 'form'

        for k,v of fields
            inputs[k] = Text(placeholder: v.placeholder)
            el.appendChild inputs[k].render()

        button = Button(label: submit)
        el.appendChild button.render()

        button.on 'click', ->
            data = {}
            for k,v of fields
                data[k] = inputs[k].getText()
            shared.trigger 'send', data

        el

    shared
