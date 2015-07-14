InputView = require '../views/input-view'
AlertView = require '../views/alert-view'
Flowdock = require 'flowdock'
_ = require 'underscore'

module.exports = FlowdockInvite =

  inviteOverFlowdock: ->
    @getKeysFromConfig()

    if @missingPusherKeys()
      new AlertView "Please set your Pusher keys."
    else if @missingFlowdockAPIToken()
      new AlertView "Please set you Flowdock API token"
    else
      inviteView = new InputView("Please enter the Flowdock mention name of your pair partner:")
      inviteView.miniEditor.focus()
      atom.commands.add inviteView.element, 'core:confirm': =>
        mentionNames = inviteView.miniEditor.getText()
        @sendFlowdockMessageTo(mentionNames)
        inviteView.panel.hide()

  sendFlowdockMessageTo: (mentionNames) ->

    # create flowdock client
    flowdockSession = Flowdock.Session
    flowdockClient = new flowdockSession(@flowdock_token)

    # generate sessionid
    @generateSessionId()

    # map over users and send invitation
    collaboratorsArray = mentionNames.match(/\w+/g)
    _.map(collaboratorsArray, (collaborator) ->

      # send invitation
      flowdockClient.privateMessage(collaborator, "Hello there #{collaborator}. You have been invited to a pairing session. If you haven't installed the AtomPair plugin, type \`apm install atom-pair\` into your terminal. Go onto Atom, hit 'Join a pairing session', and enter this string: #{@sessionId}")

      # alert user and pair setup
      new AlertView "#{collaborator} has been send an invitation. Hold tight!"
      @markerColour = @colours[0]
      @pairingSetup()
    )
