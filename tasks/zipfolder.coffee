_EasyZip = require('easy-zip').EasyZip
_fs = require 'fs'
_async = require 'async'
_crypto = require('crypto')


module.exports = (grunt)->
  grunt.registerMultiTask 'zipfolder', 'zip folder', ()->
    done = this.async()
    defaultOptions =
      hash: 'md5'
    options = this.options defaultOptions
    zipFolder = @data.folder
    filePath =  @data.dest
    hash = options.hash

    queue = []
    queue.push (next)->
      zip = new _EasyZip()
      zip.zipFolder zipFolder, ()->
        zip.writeToFile(filePath, (err)->
          return next(err) if err
          grunt.log.ok 'zip complete'
          next(null, filePath)
        )

    queue.push (filePath, next)->
      shasum = _crypto.createHash hash
      stream = _fs.ReadStream(filePath);
      stream.on 'data', (chuck)->
        shasum.update chuck

      stream.on 'end', ()->
        md5 = shasum.digest 'hex'
        next null, md5

    _async.waterfall queue, (err, md5)->
      grunt.log.error err if err
      grunt.log.ok "hash is #{md5}"
      done()
