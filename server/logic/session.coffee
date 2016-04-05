uuid = require('uuid').v4

sessions = {}

Session = {
    create: (cb) ->
        session = uuid()
        sessions[session] = {}
        cb session

    set: (session, key, value, cb) ->
        sessions[session][key] = value
        cb?()

    get: (session, key, cb) ->
        cb(sessions[session][key])

    validate: (session, cb) ->
        cb sessions[session]?
}

module.exports = Session
