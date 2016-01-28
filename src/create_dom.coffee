
module.exports =
createDom = (template) ->
    tmp = document.createElement('div')
    tmp.innerHTML = template
    tmp.children
