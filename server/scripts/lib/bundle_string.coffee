bundle = require './bundle'
fs = require 'fs'

module.exports =
bundleString = (string, cb) ->
    filePath = "#{new Date().getTime()}.js"

    fs.writeFileSync filePath, string

    bundle filePath, (args...) ->
        fs.unlink(filePath)
        cb(args...)
