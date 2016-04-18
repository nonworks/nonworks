require 'usecase'

Card = require './'

module.exports = ->
    it = Card(
        title: 'Superannons'
        imgUrl: '/map.jpg'
    )

    it
