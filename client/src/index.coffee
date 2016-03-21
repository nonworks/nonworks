require('insert-css')(require './index.styl')

document.title = 'Nonworks - Web Applications that work without frameworks.'

Main = require './main'
main = Main()
document.body.appendChild main.getEl()

main.on 'done', ->
    show()

show = ->
    document.body.style.display = 'block'

show() if main.done?
