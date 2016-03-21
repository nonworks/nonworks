Process = require 'child_process'

module.exports =
watch = (cb) ->
    cmd = Process.spawn 'inotifywait', ['-rm', '-e', 'CLOSE_WRITE', 'client/src/']

    cmd.stdout.on 'data', (output) ->
        cb()

    cmd.on 'close', ->
        console.log 'Watcher quit unexpectedly!'
