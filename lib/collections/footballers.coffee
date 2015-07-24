@Footballers = new Mongo.Collection 'footballers'
@Current = new Mongo.Collection 'current'

Meteor.methods
  drawFootballer: (role) ->
    players = Footballers.find({"role" : role}).fetch()
    if players
      shuffled = _.shuffle players
      Footballers.remove shuffled[0]

      # or update?
      Current.remove({})
      Current.insert {"player":shuffled[0], "remaining":shuffled.length-1}
    else
      throw new Meteor.Error "no-more-footballers", "You run out of footballers"

