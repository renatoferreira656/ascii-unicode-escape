{CompositeDisposable} = require 'atom'

module.exports =
  subscriptions: null

  activate: ->
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add 'atom-workspace',
      'atom-plugin:convert': => @convert()

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
