module.exports = (grunt)->
  grunt.initConfig(
    pkg: grunt.file.readJSON "package.json"
    zipfolder:
      options:
        hash: 'md5'
      zipFolder:
        folder: "build"
        dest: "build.zip"
      noTarget:
        folder: "build"
      detailPath:
        folder: "build"
        dest: "/home/ec/t/t.zip"
      zipFiles:
        src: "build/js/*.js"
        extend: false
      zipCss:
        src: "build/css/*.css"
  )
  grunt.loadTasks 'tasks'