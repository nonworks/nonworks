require('insert-css')(require './index.styl')
Component = require 'component'
{div, elem} = require 'elements'

module.exports =
VerticalMenu = ({buttons})->
    component = Component()

    # Public
    component.getEl = -> el

    # Private
    # Constructor
    frag = document.createDocumentFragment()
    frag.appendChild div 'vertical-menu-curtain'
    frag.appendChild el = div 'vertical-menu'

    for b in buttons
        do (b) ->
            b.el = elem 'button', 'vertical-menu-button', textContent: b.label
            el.appendChild b.el

            if b.children?
                b.closed = true
                b.childHolder = div 'childholder'
                el.appendChild b.childHolder

                for bc in b.children
                    bc.el = elem 'button', 'vertical-menu-button-child', textContent: bc.label
                    b.childHolder.appendChild bc.el


    # Binding
    component.registerEvents 'click'

    for b in buttons
        do (b) ->
            if b.children?
                for bc in b.children
                    do (bc) ->
                        bc.el.addEventListener 'click', ->
                            component.trigger 'click', bc.id

                b.el.addEventListener 'click', ->
                    if b.closed
                        b.childHolder.style.display = 'block'
                    else
                        b.childHolder.style.display = 'none'
                    b.closed = !b.closed
            else
                b.el.addEventListener 'click', ->
                    component.trigger 'click', b.id


    component
