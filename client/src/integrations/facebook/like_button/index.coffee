{div} = require 'elements'
require '../sdk'

Component = require 'component'

module.exports =
LikeButton = ({site}={}) ->
    component = Component()

    # Public
    component.getEl = -> el

    # Private

    # Constructor
    el = div 'fb-like'

    el.setAttribute 'data-href', site
    el.setAttribute 'data-width', 500
    el.setAttribute 'data-layout', 'standard'
    el.setAttribute 'data-action', 'like'
    el.setAttribute 'data-show-faces', 'false'
    el.setAttribute 'data-share', 'false'

    # Binding

    component
