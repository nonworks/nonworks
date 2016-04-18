{div} = require 'elements'
require('insert-css')(require('./index.styl'))
Component = require 'component'
Card = require './card'

module.exports =
CardList = ->
    component = Component()

    # Public
    component.getEl = -> el

    component.addCards = (newCards) ->
        for card in newCards
            cmp = Card(card)
            cmpel = cmp.getEl()

            cards.push {cmp, el: cmpel, card}
            el.appendChild(cmpel)

        component.redraw()

    component.redraw = ->
        window.requestAnimationFrame ->
            redraw()
            setTimeout redraw, 20
            setTimeout redraw, 1000

    # Private
    redraw = ->
        return if cards.length == 0

        width = el.offsetWidth
        columncount = Math.floor(width/380)
        padding = (width % 380)/2

        top = (0 for [1..columncount])
        col = 0

        for card in cards
            cardHeight = card.el.offsetHeight

            card.el.style.left = "#{padding + col * 380}px"
            card.el.style.top = "#{top[col]}px"
            top[col] += cardHeight + 20

            col += 1
            col = 0 if col == columncount

        maxTop = 0
        for t in top
            maxTop = t if t > maxTop

        el.style['padding-bottom'] = "#{maxTop}px"


    # Constructor
    cards = []
    first = true
    el = div 'card-list'

    # Bindings

    window.addEventListener 'resize', ->
        redraw()

    component
