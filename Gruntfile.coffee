module.exports = (grunt)->
  grunt.initConfig(
    pkg: grunt.file.readJSON "package.json"
    zipfolder:
      options:
        hash: 'md5'
      build:
        folder: "build"
        dest: "build.zip"
      test:
        folder: "build"
      test1:
        folder: "build"
        dest: "/home/ec/t/t.zip"
  )
  grunt.loadTasks 'tasks'