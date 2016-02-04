require('insert-css')(require './index.styl')
Component = require 'component'
{div} = require 'elements'
Entity = require './entity'

module.exports =
Workbench = ({map}) ->
    component = Component()

    el = undefined
    entities = []

    component.render = ->
        el = div 'workbench'

        if map?
            console.log 'hello'
            el.style['background-image'] = "url('#{map}')"

        el

    component.addEntity = (element) ->
        entity = Entity(element: element)

        el.appendChild entity.render()
        entities.push entity

    component.setEditable = (isEditable) ->
        for e in entities
            e.setMovable(isEditable)

    component
