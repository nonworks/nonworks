
Component = require 'component'
{span} = require 'elements'

module.exports =
PagePicker = ->
    component = Component()

    # Public
    component.getEl = ->
        el

    component.add = (name, cmp) ->
        pages[name] = cmp
        el.appendChild cmp.getEl()
        cmp.hide()

    component.show = (name) ->
        unless pages[name]?
            throw "No such page #{name}"

        for n,cmp of pages
            cmp.hide()

        pages[name].show()

    # Private

    # Constructor
    el = span 'page-picker'
    pages = {}

    # Binding

    component
