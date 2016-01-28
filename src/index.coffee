require('insert-css')(require './index.styl')

document.title = 'Nonworks - Web Applications that work without frameworks.'
document.body = document.createElement 'body'

Main = require './main'
document.body.appendChild Main().render()
