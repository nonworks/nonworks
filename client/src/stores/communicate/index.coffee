Event = require 'event'
extend = require 'extend'

log = (message) ->
    #console.log message

communicate = (verb, where, args..., cb) ->
    ar = if args.length > 0
        args[0]
    else
        {}
    ensureSession -> makeRequest(verb, where, ar, cb)

communicate.get = (args...) -> communicate('GET', args...)
communicate.post = (args...) -> communicate('POST', args...)
communicate.put = (args...) -> communicate('PUT', args...)
communicate.delete = (args...) -> communicate('DELETE', args...)

ensureSession = (cb) ->
    if localStorage.sessionId
        log "Found session #{localStorage.sessionId}"
        cb()
    else
        createSession -> cb()

makeRequest = (verb, where, args, cb) ->
    xhr = new XMLHttpRequest()

    uri = encodeURI("/api/#{where}")
    log "#{verb} #{uri} #{JSON.stringify(args)}"

    xhr.open verb, uri
    xhr.setRequestHeader 'session', localStorage.sessionId

    xhr.onreadystatechange = ->
        if xhr.readyState == 4
            onReady(cb)

    onReady = ->
        try
            processMessage()
        catch e
            communicate.trigger 'clientError', e.message

    processMessage = ->
        log "#{xhr.status} #{xhr.responseText}"
        if xhr.status == 200
            details = JSON.parse(xhr.responseText)
            cb(details)
        else if xhr.status == 500
            communicate.trigger 'serverError', xhr.responseText
        else
            details = JSON.parse(xhr.responseText)

            if details.error == 'invalid session'
                createSession ->
                    makeRequest(verb, where, args, cb)
            else
                cb(details)

    xhr.onerror = ->
        communicate.trigger 'connectFail'

    if verb == 'GET'
        xhr.send()
    else
        xhr.setRequestHeader 'Content-Type', 'application/json'
        xhr.send JSON.stringify(args)

createSession = (cb) ->
    log "Creating session"
    makeRequest 'POST', 'session', {}, (answer) ->

        if answer.error?
            log "Failed to create session"
            communicate.trigger 'sessionFail', answer
        else
            log "We received new session #{answer.session.id}"
            localStorage.sessionId = answer.session.id
            cb()


extend communicate, Event()

communicate.registerEvents 'connectFail', 'sessionFail', 'serverError', 'clientError'

module.exports = communicate

