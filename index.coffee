
exports.Settings = ->
    title: "Hello World"

exports.Modules = ->
    layout: 
        jade: '+yield'
        head: ["meta(name='viewport' content='width=device-width initial-scale=1.0, user-scalable=no')"]
    home:
        router: path: '/'
        jade: 
            wrapper0:
                content0: 'Hello {{text}}'
                'input#[input0](type="text")': ''
        helpers: text: -> Session.get('text') + '!'
        absurd:
            content0: position: 'fixed', top: 100
            input0:   position: 'fixed', bottom: 30, width: 100, height: 20
        events: ->
            'keypress #[input0]': (e) =>
                if e.keyCode == 13 and text = $(@id 'input0').val()
                    $(@id 'input0').val ''
                    Session.set 'text', text 
        onStartup:  ->  Session.set 'text', 'World!'
        #onRendered: -> 

