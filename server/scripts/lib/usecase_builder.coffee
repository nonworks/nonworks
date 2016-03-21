bundleString = require './bundle_string'

module.exports =
UsecaseBuilder = (component) ->
    shared = {}

    js = "var Component=require('#{component}/usecase');
         var c = Component();
         document.body.appendChild(c.render());"

    formatError = (err) ->
        err = err.message + "\n" + err.toString()
        err = err.replace(/\r?\n|\r/g, "\\n")
        err = err.replace(/'/g, "\\'")

        "
        var pre = document.createElement('pre');
        document.body.appendChild(pre);
        pre.innerHTML = '#{err}';
        "

    bodyCreator = "document.body = document.createElement('body');"

    errorcatcher = '''

        // Error Catcher
        window.onerror = function(msg, url, line, col, error) {
           var extra = !col ? "" : "\\ncolumn: " + col;
           extra += !error ? "" : "\\nerror: " + error;

           pre = document.createElement("pre");
           pre.textContent = "Error: " + msg + "\\nurl: " + url + "\\nline: " + line + extra;

           document.body.appendChild(pre);
        };
        '''

    reloader = """

        // Reloader
            var reload = function(){
                var xhr = new XMLHttpRequest();
                xhr.open('get', '/dev/reload');

                var done = false;

                var abortAndRetry = function() {
                    if (!done) {
                        xhr.abort();
                    }
                }

                setTimeout(abortAndRetry, 10000);

                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4) {
                        done = true;
                        if (xhr.status === 200) location.reload(true);
                        else if (xhr.status === 500) throw "Error in reloader" + xhr.responseText;
                        else setTimeout(reload,500);
                    }
                };
                xhr.send(null);
            };
            reload();
    """

    shared.build = (cb) ->
        bundleString js, (err, buf) ->
            out = bodyCreator + errorcatcher + reloader + (buf or formatError(err))

            cb(out)

    return shared
