module.exports = (grunt)->
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
  grunt.loadTasks 'tasks'