@Footballers = new Mongo.Collection 'footballers'

Meteor.methods
  drawPlayer: (role) ->
    player = Footballers.find({role: role}).fetch()[0]
    if !player
      throw new Meteor.Error("player-does-not-exist", "Can't extract player")
    Footballers.remove player._id
    return player
