require('insert-css')(require './index.styl')

module.exports = (component) ->
    el = document.createElement 'div'

    holder = document.createElement 'div'
    notify = document.createElement 'div'

    el.appendChild notify
    el.appendChild holder

    holder.appendChild component.render()

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
    }
