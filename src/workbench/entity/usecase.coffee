Usecase = require 'usecase'
Entity = require('./')

el = document.createElement 'div'
el.style['background-color'] = 'teal'

entity = Entity(element: el)
usecase = Usecase(entity)

module.exports = usecase.build()
