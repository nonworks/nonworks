Usecase = require 'usecase'
TextArea = require './'

text = TextArea placeholder: 'Placeholder'
usecase = Usecase(text)

usecase.setWidth 250
usecase.setHeight 50

usecase.addButton 'Get text', ->
    usecase.notify text.getText()

usecase.addButton 'Set text', ->
    text.setText('Nonworks!')

usecase.addButton 'Give focus', ->
    text.setFocus()

text.on 'submit', ->
    usecase.notify 'submit!'

module.exports = usecase.build()
