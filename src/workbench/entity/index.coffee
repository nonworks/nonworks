require('insert-css')(require './index.styl')
Component = require 'component'
{div, elem} = require 'elements'

module.exports =
Entity = ({element, width=100, height=100})->
    left = 0
    top = 0
    component = Component()

    component.getX = ->
        left

    component.getY = ->
        top

    component.getWidth = ->
        width

    component.getHeight = ->
        height

    component.render = ->
        el = div 'workbench-entity'

        el.style.width = "#{width}px"
        el.style.height = "#{height}px"

        el.appendChild right = div 'right'
        el.appendChild bottom = div 'bottom'
        el.appendChild mover = div 'mover'
        el.appendChild child = div 'child'

        element.style.width = "100%"
        element.style.height = "100%"
        child.appendChild element

        oldleft = oldtop = 0
        oldheight = 0
        oldwidth = 0
        oldx = 0
        oldy = 0
        moving = false
        movingRight = false
        movingBottom = false

        right.addEventListener 'mousedown', (e) ->
            oldwidth = width
            oldx = e.clientX
            movingRight = true
            e.preventDefault()

        bottom.addEventListener 'mousedown', (e) ->
            oldheight = height
            oldy = e.clientY
            movingBottom = true
            e.preventDefault()

        mover.addEventListener 'mousedown', (e) ->
            oldleft = left
            oldtop = top
            oldx = e.clientX
            oldy = e.clientY
            moving = true
            e.preventDefault()

        document.addEventListener 'mouseup', (e) ->
            movingRight = false
            movingBottom = false
            moving = false

        document.addEventListener 'mousemove', (e) ->
            if movingRight
                width = oldwidth - (oldx - e.clientX)
                width = 30 if width < 30
                el.style.width = "#{width}px"

            if movingBottom
                height = oldheight - (oldy - e.clientY)
                height = 30 if height < 30
                el.style.height = "#{height}px"

            if moving
                left = oldleft + e.clientX - oldx
                top = oldtop + e.clientY - oldy
                el.style.left = "#{left}px"
                el.style.top = "#{top}px"

        el

    component
