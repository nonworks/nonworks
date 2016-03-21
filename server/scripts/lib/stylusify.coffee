transformTools = require 'browserify-transform-tools'
stylus         = require 'stylus'
path           = require 'path'
esc            = require 'js-string-escape'

module.exports = transformTools.makeStringTransform(
    "stylusify",
    includeExtensions: [".styl"],
    (content, opts, done) ->
        styl = stylus(content)
        styl.include(path) for path in opts.opts.paths
        styl.render (err, css) ->
            if err
                return done(err)
            else
                return done(null, 'module.exports="'+esc(css)+'"')

)

