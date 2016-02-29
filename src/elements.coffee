elem = (tagName, klasses...) ->
    attrs = klasses.pop()
    if typeof attrs is 'string'
        klasses.push attrs
        attrs = undefined

    e = document.createElement(tagName)
    for klass in klasses
        e.classList.add(klass)

    if attrs
        for k,v of attrs
            e[k] = v
    e

div = (klasses...) ->
    elem('div', klasses...)

span = (klasses...) ->
    elem('span', klasses...)

module.exports = {elem, div, span}
