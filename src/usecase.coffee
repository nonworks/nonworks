require('insert-css')(require './index.styl')

module.exports = (component) ->
    el = document.createDocumentFragment()

    notify = document.createElement 'div'
    buttons = document.createElement 'div'

    el.appendChild buttons
    el.appendChild notify
    el.appendChild cel = component.getEl()

    notify.style['background-color'] = 'white'

    {
        notify: (data) ->
            notify.textContent = JSON.stringify(data)

        build: ->
            return ->
                {
                    render: ->
                        el
                }

        setWidth: (px) ->
            cel.style.width = "#{px}px"

        setHeight: (px) ->
            cel.style.height = "#{px}px"

        addButton: (text, cb) ->
            button = document.createElement 'button'
            button.textContent = text
            button.style.display = 'inline-block'
            button.style.padding = '10px'
            button.addEventListener 'click', cb
            buttons.appendChild button
    }
