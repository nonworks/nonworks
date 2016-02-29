require('insert-css')(require('./index.styl'))
{elem} = require 'elements'

Component = require 'component'

module.exports =
Button = ({label='', icon, theme}={}) ->
    component = Component()

    # Public
    component.mixin {
        getEl: ->
            el

        setLabel: (l) ->
            el.textContent = l
    }

    # Private

    # Constructor
    el = elem 'button', type: 'submit', textContent: label

    if icon
        el.classList.add 'icon'
        el.style['background-image'] = """url("#{icon}")"""

    if theme
        el.classList.add "theme-#{theme}"

    # Binding
    component.registerEvents 'click'

    el.addEventListener 'click', ->
        component.trigger 'click'

    component

