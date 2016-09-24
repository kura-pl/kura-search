{exec} = require("child_process")
kuraSearch = (where) ->
  editor = atom.workspace.getActiveTextEditor()
  selection = editor.getLastSelection().getText()
  my_workspace = atom.workspace.getActivePaneItem()

  website = switch where
    when 'google' then 'https://www.google.com/search?q='
    when 'ruby' then 'http://ruby-doc.com/search.html?q='
    when 'ror' then 'http://api.rubyonrails.org/?q='
    when 'jquery' then 'https://api.jquery.com/?s='
    when 'atom' then 'https://atom.io/docs/api/search/v1.10.2?q='

  exec("chromium-browser #{website}#{selection.trim().replace(/( |\n)/g, '')}", (x, y, z) -> {} )

module.exports = {
  activate: ->
    atom.commands.add(
      'atom-text-editor'
      {
        'kura-search:google': this.google
        'kura-search:ruby': this.ruby
        'kura-search:ror': this.ror
        'kura-search:jquery': this.jquery
        'kura-search:atom': this.atom

      }
    )
  google: -> kuraSearch('google')
  ruby: -> kuraSearch('ruby')
  ror: -> kuraSearch('ror')
  jquery: -> kuraSearch('jquery')
  atom: -> kuraSearch('atom')

}
