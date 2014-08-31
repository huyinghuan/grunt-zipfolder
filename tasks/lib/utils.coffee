grunt = require 'grunt'
_fs = require 'fs'
_mkdirp = require 'mkdirp'
_async = require 'async'
_crypto = require 'crypto'
_EasyZip = require('easy-zip').EasyZip

Utils = module.exports = {}

#确保文件所在的文件夹存在
promissFolder = (path)->
  index = path.lastIndexOf '/'
  #如果是当前目录则返回
  return if index is -1
  folder = path.substring 0, index
  _mkdirp.sync folder

#压缩文件夹
Utils.zipFolder = (zipFolder, filePath, hash, cb)->
  #需要压缩的文件是否存在
  return grunt.log.write "#{zipFolder} doesn't exists" if not _fs.existsSync(zipFolder)
  #确保目标文件夹存在
  promissFolder filePath
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
    cb(err, md5)

Utils.zipFiles = (src, filePath, hash, cb)->