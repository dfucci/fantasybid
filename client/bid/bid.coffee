Template.bid.events
  'click .offer': (e, tpl) ->
    e.preventDefault()
    curr = Current.findOne()
    currOffer = curr.player?.cost ? 0
    offer = tpl.$('.offering').val()
    cOwner = Meteor.user().emails[0].address.split('@')[0]
    Current.update({_id:curr._id}, {$set:{"player.cost":offer, "player.ownerId":Meteor.userId(), "player.owner":cOwner}}) if canBid()

Template.bid.helpers
  currentOffering: ->
    cOffering = Current.findOne().player?.cost ? 0
    parseInt(cOffering) + 1


# Three requirements need to be satisfied in order to bid:
# 1 - The offer is greater than the current price of the player
# 2 - The bidder has enough money
# 3 - The bidder has still slot left for that role


canBid = ->
  hasCredits() and hasSpotsLeft() and betterOffer()

hasCredits = ->
  offer = $('.offering').val()
  Meteor.user().profile.credits > offer

hasSpotsLeft = ->
  spots =
    "G": 1
    "D": 1
    "M": 1
    "F": 1

  role = Current.findOne().player.role
  playersInRole = _.filter(Meteor.user().profile.players, (pl) -> pl.role == role).length
  spots[role] - playersInRole > 0

betterOffer = ->
  curr = Current.findOne().player.cost ? 0
  offer = $('.offering').val()
  offer > parseInt(curr)