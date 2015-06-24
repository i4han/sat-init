
exports.Settings = ->
    title: "Hello World"

exports.Parts = {}
exports.Modules = ->
    layout: 
        template: -> [ blaze.Include @, 'yield' ]
        head: -> [
            html.META  @, name: 'viewport', content: 'width=device-width initial-scale=1.0, user-scalable=no'
            html.TITLE @, 'Hello World'
        ]
    home:
        path: '/'
        template: -> [ 
            html.DIV @, id: 'home-wrapper0',
                html.DIV @, id: 'home-content0', 'Hello {text}'
                html.INPUT @, id: 'home-input0', type: 'text'
        ]
        helpers: text: -> Session.get('text') + '!'
        style:
            content0: position: 'fixed', top: 100
            input0:   position: 'fixed', bottom: 30, width: 100, height: 20
        events: ->
            'keypress {#input0}': (e) =>
                if e.keyCode == 13 and text = $(@Id '#input0').val()
                    $(@Id '#input0').val ''
                    Session.set 'text', text 
        onStartup:  ->  Session.set 'text', 'World!'

