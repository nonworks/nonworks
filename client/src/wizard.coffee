
PagePicker = require 'page_picker'
{span} = require 'elements'

module.exports =
Wizard = ->
    component = PagePicker()
    base = { add: component.add, show: component.show }

    # Public
    component.add = (cmps) ->
        for name, cmp of cmps
            order.push name
            base.add(name, cmp)

    component.next = ->
        if currentIndex == order.length-1
            component.trigger 'finish'
        else
            currentIndex += 1
            base.show(order[currentIndex])

    component.previous = ->
        currentIndex -= 1
        base.show(order[0]) unless currentIndex == -1

    # Private

    # Constructor
    order = []
    currentIndex = -1

    # Binding
    component.registerEvents 'finish'

    component
