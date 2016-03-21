module.exports =
extend = (copyTo, obj) ->
    type = typeof obj

    if obj == null
        return null
    else if obj == undefined
        return undefined
    else if type != 'object'
        return obj
    else if Object.prototype.toString.call(obj) == '[object Array]'
        return (extend({},v) for v in obj)
    else
        copyTo or= {}
        for k,v of obj
            copyTo[k] = extend({},v)

        return copyTo

