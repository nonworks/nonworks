assert = require('chai').assert
UsecaseBuilder = require './usecase_builder'

describe 'usecase builder', ->

    it 'should build logo', (done) ->
        UsecaseBuilder('logo').build (result) ->
            assert.include result, "div('logo')"
            done()
