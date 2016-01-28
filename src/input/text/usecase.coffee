require 'usecase'

Text = require './'

module.exports = ->
    text = Text placeholder: 'Placeholder'

    {
        render: ->
            el = document.createElement('div')
            el.style.height = '50px'
            el.style.width = '250px'

            el.appendChild text.render()

            button = document.createElement('button')
            button.textContent = "Get Value"
            button.addEventListener 'click', ->
                button.textContent = text.getText()

            el.appendChild button
            el
    }
