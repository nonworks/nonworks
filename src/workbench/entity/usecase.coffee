Usecase = require 'usecase'
Entity = require('./')

entity = Entity()
usecase = Usecase(entity)

usecase.addButton 'Get position', ->
    usecase.notify "X: #{entity.getX()}  Y: #{entity.getY()}  Size: #{entity.getWidth()}x#{entity.getHeight()}"

usecase.addButton 'set movable', ->
    entity.setMovable true

usecase.addButton 'unset movable', ->
    entity.setMovable false

usecase.addButton 'move to 500,500', ->
    entity.setPosition 500, 500

module.exports = usecase.build()

el = document.createElement 'div'
el.style['background-color'] = 'teal'
el.style.width = '100%'
el.style.height = '100%'
entity.getBody().appendChild el

