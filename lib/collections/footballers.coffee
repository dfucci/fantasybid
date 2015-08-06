@Footballers = new Mongo.Collection 'footballers'
@Current = new Mongo.Collection 'current'

Current.allow
  update: ->
    true

Meteor.methods
  drawFootballer: (role) ->
    players = Footballers.find({"role" : role}).fetch()
    if players
      shuffled = _.shuffle players
      Footballers.remove shuffled[0]
      # or update?
      Current.remove({})
      Current.insert {"player":shuffled[0], "remaining":shuffled.length-1, "cost": 0}
    else
      throw new Meteor.Error "no-more-footballers", "You run out of footballers"

  remainingPlayers: (role) ->
    remainingPlayers = Footballers.find({"role": role}).count()
    if remainingPlayers?
      Current.update({}, {$set: {remaining: remainingPlayers}}, {upsert: true})
    else throw new Meteor.Error "no-role", "Cannot find role"
