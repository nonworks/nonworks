assert = require('chai').assert
browserify = require './bundle'

describe 'bundle', ->

    it 'should bundle given file', (done) ->

        browserify 'scripts/lib/test/browserify_test_1.coffee', (error, result) ->
            assert.isNull error
            assert.include result.toString(), 'number 2'
            done()
