require('insert-css')(require('./index.styl'))
Component = require 'component'
{elem} = require 'elements'

module.exports =
Button = ({label='', icon, theme}={}) ->
    component = Component()
    component.registerEvents 'click'

    el = undefined

    component.render = ->
        el = elem 'button'
        el.type = 'submit'
        el.textContent = label

        if icon
            el.classList.add 'icon'
            el.style['background-image'] = """url("#{icon}")"""

        if theme
            el.classList.add "theme-#{theme}"

        el.addEventListener 'click', ->
            component.trigger 'click'

        el

    component.setLabel = (l) ->
        el.textContent = l

    component
