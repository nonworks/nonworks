
module.exports =
Favicon = {
    set: (path) ->
        link = document.createElement('link')
        link.type = 'image/png'
        link.rel = 'icon'
        link.href = path
        document.getElementsByTagName('head')[0].appendChild(link)
}

