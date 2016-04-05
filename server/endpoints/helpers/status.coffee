
module.exports =
status = (answer) ->
    switch answer.error
        when 'some error code here' then 500
        else 200
