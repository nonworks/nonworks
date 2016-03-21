Usecase = require 'usecase'
VerticalMenu = require('./')

menu = VerticalMenu buttons: [
    {
        id: 'first'
        label: 'First button'
        children: [
            {
                id: 'firstchild'
                label: 'First button -> 1'
            }
            {
                id: 'secondchild'
                label: 'First button -> 2'
            }
        ]
    },
    {
        id: 'second'
        label: '2nd button'
    }
]

usecase = Usecase (menu)

menu.on 'click', (id) ->
    usecase.notify "We clicked #{id}"

module.exports = usecase.build()
