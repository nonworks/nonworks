Usecase = require 'usecase'
Form = require './'

form = Form(
    fields: {
        first: { placeholder: 'First one' }
        second: { placeholder: 'Second one' }
        third: { placeholder: 'Password', type: 'password' }
        description: { placeholder: 'Description', type: 'textarea' }
    }
    submit: 'This would send it'
)
usecase = Usecase(form)
usecase.setWidth 500

form.on 'send', (data) ->
    usecase.notify(data)

module.exports = usecase.build()
