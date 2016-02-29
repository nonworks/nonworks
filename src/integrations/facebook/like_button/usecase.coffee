Usecase = require 'usecase'
FacebookLikeButton = require './'

it = FacebookLikeButton('https://www.facebook.com/')
usecase = Usecase(it)

module.exports = usecase.build()
