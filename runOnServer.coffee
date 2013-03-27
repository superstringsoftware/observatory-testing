require = if Npm? then Npm.require else __meteor_bootstrap__.require
Mocha = require 'mocha'
fs = require("fs")
path = require("path")
chai = require("chai")

Meteor.startup ->
  runServerTests()

runServerTests = ->
  mocha = new Mocha({ui: 'bdd', reporter: 'spec'}); # spec
  Mocha.reporters.Base.useColors = true
  #console.dir mocha.addFile.toString()
  #mocha._reporter = MeteorReporter

  fs.readdirSync("tests").filter((file) ->
    file.substr(-3) is ".js"
  ).forEach (file) ->
    # Use the method "addFile" to add the file to mocha
    mocha.addFile path.join("tests", file)

  # Now, you can run the tests.
  mocha.run()
  #console.dir res



class MeteorReporter extends Mocha.reporters.Base
  constructor: (runner)->

    #console.log @stats
    super runner
    #console.log @stats
    @tests = []
    @failures = []
    @passes = []

    runner.on "test end", (test) =>
      @tests.push test

    runner.on "pass", (test) =>
      @passes.push test

    runner.on "fail", (test, err) =>
      #console.error()
      console.log err.message
      console.log err.stack
      console.log err.expected
      console.log err.actual
      #console.dir test
      #e = _.clone err
      #test.err = e
      @failures.push test #{test: test, error: err.stack}


    #runner.on('end', self.epilogue.bind(self));

    runner.on "end", =>
      console.log @stats
      #console.dir @tests
      console.dir @passes
      console.dir @failures





#MeteorReporter::__proto__ = Mocha.reporters.Base::
