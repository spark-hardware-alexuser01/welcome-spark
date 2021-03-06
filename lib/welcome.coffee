path = require 'path'

module.exports =
  configDefaults:
    showOnStartup: true

  activate: ->
    atom.workspaceView.command 'welcome-spark:show-welcome-buffer', => @show()
    if atom.config.get('welcome-spark.showOnStartup')
      @show()
      atom.config.set('welcome-spark.showOnStartup', false)
      atom.config.set('core.themes', [
        'atom-dark-ui',
        'monokai'
      ])
      atom.config.set('toolbar.position', 'Left')

  show: ->
    welcomePath = path.resolve(__dirname, '..', 'docs', process.platform, 'welcome.md')
    atom.workspaceView.open welcomePath
