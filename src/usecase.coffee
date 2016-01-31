require('insert-css')(require './index.styl')

module.exports = (component) ->
    el = document.createDocumentFragment()

    holder = document.createElement 'div'
    notify = document.createElement 'div'
    buttons = document.createElement 'div'

    el.appendChild buttons
    el.appendChild notify
    el.appendChild component.render()

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
            holder.style.width = "#{px}px"

        setHeight: (px) ->
            holder.style.height = "#{px}px"

        addButton: (text, cb) ->
            button = document.createElement 'button'
            button.textContent = text
            button.style.display = 'inline-block'
            button.style.padding = '10px'
            button.addEventListener 'click', cb
            buttons.appendChild button
    }
