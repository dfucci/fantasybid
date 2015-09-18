@Footballers = new Mongo.Collection 'footballers'
@Current = new Mongo.Collection 'current'

# TODO: add credits when game starts
# TODO: set proper number of slots per role
# TODO: negative number bidding
# TODO: transform email in username
# TODO: fix UX


Meteor.users.allow
  update: ->
    true

Current.allow
  update: ->
    true

Meteor.methods
  drawFootballer: (role) ->
    players = Footballers.find({"ROLE" : role}).fetch()
    if players
      shuffled = _.shuffle players
      Footballers.remove shuffled[0]
      # or update?
      Current.remove({})
      Current.insert {"player":shuffled[0], "remaining":shuffled.length-1, "cost": 0}
    else
      throw new Meteor.Error "no-more-footballers", "You run out of footballers"

  remainingPlayers: (role) ->
    remainingPlayers = Footballers.find({"ROLE": role}).count()
    if remainingPlayers?
      Current.update({}, {$set: {remaining: remainingPlayers}}, {upsert: true})
    else throw new Meteor.Error "no-role", "Cannot find role"
