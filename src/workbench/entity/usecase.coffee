Usecase = require 'usecase'
Entity = require('./')

entity = Entity(size: [75, 40], position: [200,100])
usecase = Usecase(entity)

usecase.addButton 'Get position', ->
    usecase.notify "X: #{entity.getX()}  Y: #{entity.getY()}  Size: #{entity.getWidth()}x#{entity.getHeight()}"

usecase.addButton 'set movable', ->
    entity.setMovable true

usecase.addButton 'unset movable', ->
    entity.setMovable false

usecase.addButton 'move to 500,500', ->
    entity.setPosition 500, 500

usecase.addButton 'get configuration', ->
    usecase.notify entity.getConfiguration()

module.exports = usecase.build()

el = document.createElement 'div'
el.style['background-color'] = 'teal'
el.style.width = '100%'
el.style.height = '100%'
entity.getBody().appendChild el
