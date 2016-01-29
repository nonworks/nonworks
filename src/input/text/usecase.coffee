Usecase = require 'usecase'
Text = require './'

text = Text placeholder: 'Placeholder'
usecase = Usecase(text)

usecase.setWidth 250
usecase.setHeight 50

usecase.addButton 'Get Value', ->
    usecase.notify text.getText()

module.exports = usecase.build()
