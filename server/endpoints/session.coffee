status = require './helpers/status'

createSession = require('../business/create_session')()

module.exports = (app) ->

    app.post '/api/session', (req, res) ->
        createSession (answer) ->
            res.status status(answer)
            res.json answer
