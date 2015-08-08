Template.bid.events
  'click .offer': (e, tpl) ->
    e.preventDefault()
    curr = Current.findOne()
    currOffer = curr.player?.cost ? 0
    offer = tpl.$('.offering').val()
    cOwner = Meteor.user().emails[0].address.split('@')[0]
    Current.update({_id:curr._id}, {$set:{"player.cost":offer, "player.ownerId":Meteor.userId(), "player.owner":cOwner}}) if offer > parseInt currOffer

Template.bid.helpers
  currentOffering: ->
    cOffering = Current.findOne().player?.cost ? 0
    parseInt(cOffering) + 1
