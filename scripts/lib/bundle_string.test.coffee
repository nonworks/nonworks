assert = require('chai').assert
bundleString = require './bundle_string'

describe 'bundle string', ->

    it 'should bundle given file', (done) ->

        bundleString 'require("./scripts/lib/test/browserify_test_2");', (error, result) ->
            assert.isNull error
            assert.include result.toString(), 'number 2'
            done()
