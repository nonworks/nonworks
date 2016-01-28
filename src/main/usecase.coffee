Usecase = require 'usecase'

usecase = Usecase require('./')()

module.exports = usecase.build()
