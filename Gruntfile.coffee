module.exports = (grunt) ->

  sourceThemeFolder = 'source'
  compiledThemeFolder = 'compiled'
  templateExtension = 'pugstache'
  templateExtensionCompiled = 'mustache'
  catchAllFiles = ['**/*.*', "!**/*.#{templateExtension}", '!**/*.styl']

  grunt.initConfig

    stylus:

      development:
        files: [ {
          expand: true
          cwd: sourceThemeFolder
          src: '**/*.styl'
          dest: compiledThemeFolder
          ext: '.css'
        } ]

    jade:

      development:
        files: [ {
          expand: true
          cwd: sourceThemeFolder
          src: "**/*.#{templateExtension}"
          dest: compiledThemeFolder
          ext: ".#{templateExtensionCompiled}"
        } ]

    copy:

      composer:
        files: [
          src: 'vendor/**'
          dest: "#{compiledThemeFolder}/"
        ]

      catchAllFiles:
        files: [
          cwd: sourceThemeFolder
          src: catchAllFiles
          dest: compiledThemeFolder
          expand: true
        ]

    watch:

      options:
        livereload: true

      stylus:
        files: [
          '**/*.styl'
        ]
        tasks: [
          'stylus'
        ]

      jade:
        files: [
          "**/*.#{templateExtension}"
        ]
        tasks: [
          'newer:jade'
        ]

      catchAllFiles:
        files: catchAllFiles
        tasks: [
          'newer:copy'
        ]

  grunt.registerTask 'compile', [
    'stylus'
    'jade'
  ]

  grunt.registerTask 'go', [
    'compile'
    'copy'
    'watch'
  ]

  grunt.loadNpmTasks 'grunt-contrib-jade'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-stylus'
  grunt.loadNpmTasks 'grunt-newer'
