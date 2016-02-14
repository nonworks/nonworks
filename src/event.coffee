module.exports =
Event = ->
    cbs = {}

    me = {
        registerEvents: (events...) ->
            cbs[e] = [] for e in events
            null

        on: (event, cb) ->
            event = cbs[event] or throw("Can't register to event '#{event}' - it doesn't exist")
            event.push cb

        trigger: (event, args) ->
            cb(args) for cb in cbs[event]
            return null

        getEvents: ->
            Object.keys(cbs)

        hasEvent: (event) ->
            (event in cbs)

        pipeFrom: (others...) ->
            others.forEach (other) ->
                other.getEvents().forEach (event) ->
                    do (other, event) ->
                        cbs[event] or= []
                        other.on event, (args...) -> me.trigger event, args...
    }
