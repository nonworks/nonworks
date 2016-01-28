browserify = require 'browserify'
stylusify = require './stylusify.coffee'

module.exports =
bundle = (file, cb) ->
    b = browserify(file, {
      cache: {},
      packageCache: {},
      fullPaths: false,
      paths: ['src'],
      extensions: ['.coffee', '.styl']
      transform: [
          ['coffeeify'],
          ['jadeify', {basedir: "src", pretty: false}],
          [stylusify, {paths: ['src']}]
      ]
    })

    bundle = b.bundle(cb)
    b.on 'error', (e) ->
        cb(e)
