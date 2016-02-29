Usecase = require 'usecase'
FacebookLikeButton = require './'

it = FacebookLikeButton(site: 'https://www.facebook.com/')
usecase = Usecase(it)

module.exports = usecase.build()
