Usecase = require 'usecase'
EditableLabel = require './'

editableLabel = EditableLabel(text: 'Hello')
usecase = Usecase(editableLabel)

usecase.setWidth 250
usecase.setHeight 50

usecase.addButton 'Get Value', ->
    usecase.notify editableLabel.getText()

module.exports = usecase.build()
