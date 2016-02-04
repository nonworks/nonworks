Usecase = require 'usecase'
Workbench = require 'workbench'

workbench = Workbench(map: '/map.jpg')
usecase = Usecase(workbench)

usecase.addButton 'Create', ->
    el = document.createElement 'div'
    el.style.width = '100%'
    el.style.height = '100%'
    el.style['background-color'] = 'teal'

    workbench.addEntity el

usecase.addButton 'Turn on editable', ->
    workbench.setEditable true

usecase.addButton 'Turn off editable', ->
    workbench.setEditable false

module.exports = usecase.build()
