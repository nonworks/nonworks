Usecase = require 'usecase'
Form = require './'

form = Form(
    fields: {
        disabled: { disabled: true }
        first: { placeholder: 'First one' }
        second: { placeholder: 'Second one' }
        third: { placeholder: 'Password', type: 'password' }
        description: { placeholder: 'Description', type: 'textarea' }
    }
    submit: 'This would send it'
)
usecase = Usecase(form)
usecase.setWidth 500

usecase.addButton 'Set Form Data', ->
    form.update {
        disabled: 'this one is disabled'
        first: 1
        second: 2
        third: '123'
        description: 'Description'
    }

form.on 'send', (data) ->
    usecase.notify(data)

module.exports = usecase.build()
