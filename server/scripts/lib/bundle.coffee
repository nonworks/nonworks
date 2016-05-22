browserify = require 'browserify'
browserifyInc = require 'browserify-incremental'
stylusify = require './stylusify.coffee'

module.exports =
bundle = (file, cb) ->
    b = browserify(file, {
      cache: {},
      packageCache: {},
      fullPaths: true,
      paths: ['client/src', 'common'],
      extensions: ['.coffee', '.styl']
      transform: [
          ['coffeeify'],
          ['jadeify', {basedir: "client/src", pretty: false}],
          [stylusify, {paths: ['client/src']}]
          ['yamlify']
      ]
    })

    b = browserifyInc(b, cacheFile: './browserify-cache.json')

    b.on 'error', (e) ->
        console.log e
        cb(e)

    stream = b.bundle()

    buf = ''

    stream.on 'data', (data) ->
        buf += data

    stream.on 'end', ->
        console.log 'done!'
        cb null, buf
