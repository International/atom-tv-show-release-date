{$, TextEditorView, View} = require 'atom-space-pen-views'
{CompositeDisposable} = require 'atom'

module.exports =
class TvShowReleaseDateView extends View
  @content: ->
    @div =>
      @div class: 'block', =>
        @subview 'movieName', new TextEditorView(mini: true, placeholderText: 'Movie')

  initialize:  ->
    @disposables = new CompositeDisposable
    currentPane = atom.workspace.getActivePane()
    @panel ?= atom.workspace.addModalPanel(item: this)
    @panel.show()
    @disposables.add atom.commands.add 'atom-text-editor', 'core:cancel': => @destroy()
    @disposables.add atom.commands.add 'atom-text-editor', 'core:confirm': => @searchTvShow()
    @movieName.focus()

  searchTvShow: ->
    window.alert @movieName.getModel().getText()
    @destroy()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @panel?.destroy()
    @disposables.dispose()

  getElement: ->
    @element
