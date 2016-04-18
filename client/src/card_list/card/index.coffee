require('insert-css')(require('./index.styl'))
Component = require 'component'
{div, elem} = require 'elements'

module.exports =
Card = ({title, imgUrl}) ->
    component = Component()

    component.getEl = ->
        el

    el = div 'card'
    (el.appendChild elem 'img', 'image').setAttribute 'src', imgUrl
    (el.appendChild div 'title'    ).textContent = title

    el

    component
