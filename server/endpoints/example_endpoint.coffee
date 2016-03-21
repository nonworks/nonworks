
module.exports =
ExampleEndpoint = (app) ->

    app.get '/test', (req, res) ->
        res.send "Hello there"
        res.end()
