
module.exports =
CreateSession = ({
    Session = require '../logic/session'
}={}) ->

    createSession = (cb) ->
        Session.create (session) ->
            cb { session: { id: session } }
