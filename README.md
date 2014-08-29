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
      build:
        folder: "build"
        dest: "build.zip"
  )
```

## options [optional]
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
  
## tasks

### tasks.folder
  the folder need be zip
  
### task.dest
  the path where the zip file will be saved
  
## LICENSE
MIT

  see https://github.com/huyinghuan/grunt-file2head/blob/master/LICENSE-MIT
