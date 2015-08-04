_ = require 'underscore'

module.exports = AtomPairConfig =

  getKeysFromConfig: ->
    @app_key = atom.config.get 'atom-pair.pusher_app_key'
    @app_secret = atom.config.get 'atom-pair.pusher_app_secret'
    @hc_key = atom.config.get 'atom-pair.hipchat_token'
    @room_name = atom.config.get 'atom-pair.hipchat_room_name'
    @slack_url = atom.config.get 'atom-pair.slack_url'
    @flowdock_user = atom.config.get 'atom-pair.flowdock_user'
    @flowdock_pass = atom.config.get 'atom-pair.flowdock_pass'

  missingPusherKeys: -> _.any([@app_key, @app_secret], @missing)
  missingHipChatKeys: -> _.any([@hc_key, @room_name], @missing)
  missingSlackWebHook: -> _.any([@slack_url], @missing)
  missingFlowdockKeys: -> _.any([@flowdock_user, @flowdock_pass], @missing)
  missing: (key) -> key is '' || typeof(key) is "undefined"
