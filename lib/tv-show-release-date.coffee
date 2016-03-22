TvShowReleaseDateView = require './tv-show-release-date-view'
{CompositeDisposable} = require 'atom'

module.exports = TvShowReleaseDate =
  tvShowReleaseDateView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'tv-show-release-date:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @tvShowReleaseDateView.destroy()

  serialize: ->
    tvShowReleaseDateViewState: @tvShowReleaseDateView.serialize()

  toggle: ->
    @tvShowReleaseDateView = new TvShowReleaseDateView()
