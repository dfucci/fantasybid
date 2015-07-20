@Footballers = new Mongo.Collection 'footballers'

Meteor.methods
  drawPlayer: (role) ->
    player = Footballers.find({role: role}).fetch()[0]
    console.log player
    if !player
      throw new Meteor.Error("player-does-not-exist", "Can't extract player")
    return player
