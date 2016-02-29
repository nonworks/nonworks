Component = require 'component'
Text = require 'input/text'
Button = require 'input/button'

{div} = require 'elements'

module.exports =
Form = ({fields, submit}) ->
    component = Component()
    component.registerEvents 'send'

    inputs = {}

    component.render = ->
        el = div 'form'

        for k,v of fields
            text = inputs[k] = Text()
            el.appendChild inputs[k].render()

        button = Button(label: submit)
        el.appendChild button.render()

        button.on 'click', ->
            data = {}
            for k,v of fields
                data[k] = inputs[k].getText()
            component.trigger 'send', data

        el

    component
