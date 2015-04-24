module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    clean:
      phpunit: ['phpunit/']
      docs: ['docs/']

    gitclone:
      clone:
        options:
          repository: 'https://github.com/sebastianbergmann/phpunit'
          branch: 'master'
          directory: 'phpunit'

    composer:
      phpunit:
        options:
          cwd: 'phpunit'

    phpdoc2:
      phpunit:
        options:
          directories: [
            'phpunit/'
          ],
          output: 'docs/'
          config: 'phpdoc2.json'

  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-composer'
  grunt.loadNpmTasks 'grunt-git'
  grunt.loadNpmTasks 'grunt-phpdoc2'

  grunt.registerTask 'default', 'Generate documentation', [
    'clean',
    'gitclone',
    'composer:phpunit:install'
    'phpdoc2'
  ]
