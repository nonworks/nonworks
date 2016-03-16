express = require 'express'
UsecaseBuilder = require './lib/usecase_builder'
watch = require './lib/watch'
bundle = require './lib/bundle'

app = express()
app.disable('etag')

app.use(express.static('public'));

debug = process.env.NODE_ENV != 'production'

if debug
    listeners = []

    watch ->
        list = listeners
        listeners = []
        for l in list
            l.json change: true

    app.get '/dev/reload', (req, res) ->
        listeners.push res

    app.get /^\/dev\/(.*)\/js$/, (req, res) ->
        component = req.params[0]
        UsecaseBuilder(component).build (out) ->
            res.setHeader 'Content-Type', 'application/javascript'
            res.send out
            res.end()

    app.get /^\/dev\/(.*)$/, (req, res) ->
        component = req.params[0]
        res.setHeader 'Content-Type', 'text/html; charset=utf-8'
        res.send("""
            <!DOCTYPE html>
            <body style=\"margin: 0px;\">
            <script src=\"/dev/#{component}/js\"></script>
            </body>
        """)

compiledJs = null

app.get '/js', (req, res) ->
    res.setHeader 'Content-Type', 'application/javascript'

    if compiledJs and not debug
        res.send compiledJs
    else
        console.log 'compiling'
        bundle 'src/index.coffee', (err, buf) ->
            compiledJs = buf
            res.send compiledJs
            res.end()

app.get '/', (req, res) ->
    res.setHeader 'Content-Type', 'text/html; charset=utf-8'
    res.send('<!DOCTYPE html><body style="display:none"><script src="js"></script></body>')

iface = if debug then 'localhost' else '0.0.0.0'
port = process.env.PORT or 3000

server = app.listen port, iface, ->
    host = server.address().address
    port = server.address().port

    console.log 'Web-app listening at http://%s:%s', host, port
