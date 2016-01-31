require('insert-css')(require './index.styl')
Component = require 'component'
{div, elem} = require 'elements'

module.exports =
VerticalMenu = ({buttons})->
    component = Component()

    component.registerEvents 'click'

    component.render = ->
        frag = document.createDocumentFragment()
        frag.appendChild div 'vertical-menu-curtain'
        frag.appendChild el = div 'vertical-menu'

        for b in buttons
            do (b) ->
                bel = elem 'button', 'vertical-menu-button'
                bel.textContent = b.label
                el.appendChild bel

                if b.children?
                    b.closed = true
                    b.childHolder = div 'childholder'
                    el.appendChild b.childHolder

                    for bc in b.children
                        bcel = elem 'button', 'vertical-menu-button-child'
                        bcel.textContent = bc.label
                        b.childHolder.appendChild bcel
                        do (bc) ->
                            bcel.addEventListener 'click', ->
                                component.trigger 'click', bc.id

                    bel.addEventListener 'click', ->
                        if b.closed
                            b.childHolder.style.display = 'block'
                        else
                            b.childHolder.style.display = 'none'
                        b.closed = !b.closed

                else
                    bel.addEventListener 'click', ->
                        component.trigger 'click', b.id

        frag

    component
