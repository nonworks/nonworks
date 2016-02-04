Usecase = require 'usecase'
Entity = require('./')

el = document.createElement 'div'
el.style['background-color'] = 'teal'
el.style.width = '100%'
el.style.height = '100%'

entity = Entity(element: el)
usecase = Usecase(entity)

usecase.addButton 'Get position', ->
    usecase.notify "X: #{entity.getX()}  Y: #{entity.getY()}  Size: #{entity.getWidth()}x#{entity.getHeight()}"

module.exports = usecase.build()
