
communicate = require './communicate'
Store = require './store'

module.exports =
Example = Store()

Example.pushSomeData = (args, cb) ->
    communicate.put 'dataLobster', args, (answer) ->

        if answer.error?
            alert JSON.stringify answer
        else
            cb(example: answer.example)

