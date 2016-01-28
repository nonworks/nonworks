Usecase = require('usecase')
Button = (require './')

button = Button(label: 'Hello')
usecase = Usecase(button)

button.on 'click', ->
    usecase.notify 'I was clicked!'

module.exports = usecase.build()
