grunt-zipfolder
==============
  zip folder after build
  
## Install
```shell
npm install klyg-zipfolder
```

## How to use
for example:

```coffeescript
grunt.initConfig(
    pkg: grunt.file.readJSON "package.json"
    zipfolder:
      options:
        hash: 'md5'
      zipFolder:
        folder: "be-ziped-folder"
        dest: "be-ziped-folder.zip"
      noTarget:
        folder: "be-ziped-folder"
      zipFilesExtend:
        src: ["be-ziped-folder/*.js", "be-ziped-folder/*/*.js"]
        extend: true
      zipFilesNotExtend:
        src:  ["be-ziped-folder/*.js", "be-ziped-folder/*/*.js"]
        extend: false
      zipFilesSetCwd:
        cwd: 'be-ziped-folder'
        src: ["*.js", "*/*.js"]
  )
```

## options
  [optional] Object
  setting of zipfolder

### options.hash
  create hash digests for the zip file.
  support:
 
```
[ 
  'DSA',
  'DSA-SHA',
  'DSA-SHA1',
  'DSA-SHA1-old',
  'RSA-MD4',
  'RSA-MD5',
  'RSA-MDC2',
  'RSA-RIPEMD160',
  'RSA-SHA',
  'RSA-SHA1',
  'RSA-SHA1-2',
  'RSA-SHA224',
  'RSA-SHA256',
  'RSA-SHA384',
  'RSA-SHA512',
  'dsaEncryption',
  'dsaWithSHA',
  'dsaWithSHA1',
  'dss1',
  'ecdsa-with-SHA1',
  'md4',
  'md4WithRSAEncryption',
  'md5',
  'md5WithRSAEncryption',
  'mdc2',
  'mdc2WithRSA',
  'ripemd',
  'ripemd160',
  'ripemd160WithRSA',
  'rmd160',
  'sha',
  'sha1',
  'sha1WithRSAEncryption',
  'sha224',
  'sha224WithRSAEncryption',
  'sha256',
  'sha256WithRSAEncryption',
  'sha384',
  'sha384WithRSAEncryption',
  'sha512',
  'sha512WithRSAEncryption',
  'shaWithRSAEncryption',
  'ssl2-md5',
  'ssl3-md5',
  'ssl3-sha1',
  'whirlpool' 
]
```

### options.extend
  [optional] Boolean. default: ture.
  compress files use file availibalfull path ? it's available when compress files.

### options.cwd
  [optional] String. default: ''
  compress files where is in director ```cwd```


## tasks

### tasks.folder
  [optional] String. default: undefined
  the folder need be compressed. Must choose one of them ```tasks.folder``` or ```tasks.src```.

### tasks.src
  [options] String or String Array. default: undefined.
  the files need be compressed.   Must choose one of them ```tasks.folder``` or ```tasks.src```.

### task.dest
  [optioanl] String.
  the path where the compressed file will be saved. if it is undefined, then the ```dest``` will be
  the folder name (when compress a folder) or the task name (when compress files)

### task.extend
  [optional] Boolean.
  it will override the ```options.extend```

### task.cwd
  [optional] String.
  it will override the ```options.cwd```

### task.hash
  [optional] String.
  it will override the ```options.hash```

## History

v0.0.2

1. add zip files

V0.0.1

1. zip folder

## LICENSE
MIT

  see https://github.com/huyinghuan/grunt-file2head/blob/master/LICENSE-MIT

