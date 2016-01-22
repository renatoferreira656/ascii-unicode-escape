{CompositeDisposable} = require 'atom'

module.exports =
  subscriptions: null

  activate: ->
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add 'atom-workspace',
      'ascii-unicode-escape:convert': => @convert()
    @subscriptions.add atom.commands.add 'atom-workspace',
        'ascii-unicode-escape:reverse': => @reverse()
  deactivate: ->
    @subscriptions.dispose()

  convert: ->
    if editor = atom.workspace.getActiveTextEditor()
       selection = editor.getSelectedText()
       selection = selection.replace /[\s\S]/g, (escape) ->
           code = escape.charCodeAt()
           return escape if code < 128
           return '\\u' + ('0000' + code.toString(16)).slice(-4)
       editor.insertText("#{selection}")
  reverse: ->
    if editor = atom.workspace.getActiveTextEditor()
        regex_reverse = /\\u([\d\w]{4})/gi
        selection = editor.getSelectedText()
        selection = selection.replace regex_reverse, (escape, grp) ->
            number = parseInt(grp, 16)
            return String.fromCharCode( number )
        editor.insertText("#{selection}")
