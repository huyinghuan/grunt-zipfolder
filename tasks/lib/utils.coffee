grunt = require 'grunt'
_fs = require 'fs'
_path = require 'path'
_crypto = require 'crypto'

_mkdirp = require 'mkdirp'
_async = require 'async'
_EasyZip = require('easy-zip').EasyZip

Utils = module.exports = {}
#浅继承
Utils.extend = (son, father)->
  son[key] = value for key, value of father

#组合path路径
Utils.getJoinPath = (srcs, cwd)->
  cwd = '' if grunt.util.kindOf(cwd) isnt 'string'
  srcs = [].concat srcs
  queue = []
  queue.push _path.join(cwd, src) for src in srcs
  files = []
  files = files.concat grunt.file.expand filePath for filePath in queue
  return files

#确保文件所在的文件夹存在
promissFolder = (path)->
  index = path.lastIndexOf '/'
  #如果是当前目录则返回
  return if index is -1
  folder = path.substring 0, index
  _mkdirp.sync folder

#获取文件md5值
getMD5 = (path, hash, cb)->
  shasum = _crypto.createHash hash
  stream = _fs.ReadStream(path);
  stream.on 'data', (chuck)->
    shasum.update chuck

  stream.on 'end', ()->
    md5 = shasum.digest 'hex'
    cb null, md5

#获取文件名
getFileName = (path)->
  return path if path.indexOf('/') is -1
  path.replace /.*\/([^\/]+)$/, '$1'

#压缩文件夹
Utils.zipFolder = (zipFolder, filePath, options, cb)->
  hash = options.hash
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
    getMD5 filePath, hash, next

  _async.waterfall queue, (err, md5)->
    cb(err, md5)

Utils.zipFiles = (srcs, filePath, options, cb)->
  hash = options.hash
  extend = options.extend
  zip = new _EasyZip()
  queue = []
  for file in srcs
    targetFile = if extend then file else getFileName(file)
    queue.push
      source: file
      target: targetFile

  zip.batchAdd queue, ()->
    zip.writeToFile(filePath, (err)->
      return next(err) if err
      grunt.log.ok 'zip complete'
      getMD5 filePath, hash, cb
    )
