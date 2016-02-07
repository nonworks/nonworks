require('insert-css')(require './index.styl')
Component = require 'component'
{div, elem} = require 'elements'

module.exports =
Entity = ({width=100, height=100}={})->
    left = 0
    top = 0
    component = Component()

    child = undefined
    right = undefined
    bottom = undefined
    mover = undefined
    el = undefined

    setLeft = (x) ->
        el.style.left = "#{x}px"

    setTop = (y) ->
        el.style.top = "#{y}px"

    setWidth = (w) ->
        el.style.width = "#{w}px"

    setHeight = (w) ->
        el.style.height = "#{w}px"

    component.getBody = ->
        return child

    component.getX = ->
        left

    component.getY = ->
        top

    component.setPosition = (x,y) ->
        left = x
        top = y
        setLeft(x)
        setTop(y)

    component.getWidth = ->
        width

    component.getHeight = ->
        height

    component.getConfiguration = ->
        {
            position: [component.getX(), component.getY()]
            size: [component.getWidth(), component.getHeight()]
        }

    component.setMovable = (movable) ->
        if movable
            right.style.display = bottom.style.display = mover.style.display = 'block'
            el.classList.remove 'no-border'
        else
            right.style.display = bottom.style.display = mover.style.display = 'none'
            el.classList.add 'no-border'

    component.render = ->
        el = div 'workbench-entity'

        setWidth(width)
        setHeight(height)

        el.appendChild right = div 'right'
        el.appendChild bottom = div 'bottom'
        el.appendChild mover = div 'mover'
        el.appendChild child = div 'child'

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
                setWidth(width)

            if movingBottom
                height = oldheight - (oldy - e.clientY)
                height = 30 if height < 30
                setHeight(height)

            if moving
                left = oldleft + e.clientX - oldx
                top = oldtop + e.clientY - oldy
                setLeft(left)
                setTop(top)

        el

    component
