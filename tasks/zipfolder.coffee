_utils = require './lib/utils'

module.exports = (grunt)->
  grunt.registerMultiTask 'zipfolder', 'zip folder', ()->
    done = this.async()
    completeCallback = (err, md5)->
      grunt.log.error err if err
      grunt.log.ok "hash is #{md5}"
      done()

    defaultOptions =
      hash: 'md5'
    options = this.options defaultOptions
    zipFolder = @data.folder
    zipFiles = @data.src
    filePath =  @data.dest or "#{zipFolder}.zip"
    hash = options.hash
    if zipFolder
      _utils.zipFolder zipFolder, filePath, hash, completeCallback

    filePath = @data.dest or "#{@target}.zip"
    if zipFiles
      _utils.zipFiles zipFiles, filePath, hash, completeCallback