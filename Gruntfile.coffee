module.exports = (grunt)->
  grunt.initConfig(
    pkg: grunt.file.readJSON "package.json"
    zipfolder:
      options:
        hash: 'md5'
      build:
        folder: "build"
        dest: "build.zip"
  )
  grunt.loadTasks 'tasks'