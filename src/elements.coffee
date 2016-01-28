elem = (tagName, klasses...) ->
    e = document.createElement(tagName)
    for klass in klasses
        e.classList.add(klass)
    e

div = (klasses...) ->
    elem('div', klasses...)

span = (klasses...) ->
    elem('span', klasses...)

module.exports = {elem, div, span}
