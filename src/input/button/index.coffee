require('insert-css')(require('./index.styl'))
Component = require 'component'
{elem} = require 'elements'

module.exports =
Button = ({label, icon, theme}) ->
    shared = Component()
    shared.registerEvents 'click'

    shared.render = ->
        el = elem 'button'
        el.type = 'submit'
        el.textContent = label

        if icon
            el.classList.add 'icon'
            el.style['background-image'] = """url("#{icon}")"""

        if theme
            el.classList.add "theme-#{theme}"

        el.addEventListener 'click', ->
            shared.trigger 'click'

        el

    shared
