Usecase = require 'usecase'
Text = require './'

text = Text placeholder: 'Placeholder'
usecase = Usecase(text)

usecase.setWidth 250
usecase.setHeight 50

usecase.addButton 'Get text', ->
    usecase.notify text.getText()

usecase.addButton 'Set text', ->
    text.setText('Nonworks!')

module.exports = usecase.build()
