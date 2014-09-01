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
      extend: true #压缩多个文件时，是否按原有目录压缩

    options = this.options defaultOptions
    zipFolder = @data.folder
    zipFiles = @data.src

    if zipFolder
      #目标文件不存在则设置压缩目录为文件名
      filePath =  @data.dest or "#{zipFolder}.zip"
      _utils.zipFolder zipFolder, filePath, options, completeCallback

    if zipFiles
      filePath = @data.dest or "#{@target}.zip"
      _utils.zipFiles zipFiles, filePath, options, completeCallback