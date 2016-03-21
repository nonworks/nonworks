browserify = require 'browserify'
stylusify = require './stylusify.coffee'

module.exports =
bundle = (file, cb) ->
    b = browserify(file, {
      cache: {},
      packageCache: {},
      fullPaths: false,
      paths: ['client/src'],
      extensions: ['.coffee', '.styl']
      transform: [
          ['coffeeify'],
          ['jadeify', {basedir: "client/src", pretty: false}],
          [stylusify, {paths: ['client/src']}]
      ]
    })

    bundle = b.bundle(cb)
    b.on 'error', (e) ->
        cb(e)
