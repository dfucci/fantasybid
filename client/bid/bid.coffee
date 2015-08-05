Template.bid.events
  'click .offer': (e, tpl) ->
    e.preventDefault()
    currentOffer = parseInt(Current.findOne().player.cost)
    cPlayer = Current.findOne()
    offer = tpl.$('.offering').val()
    Current.update({_id:cPlayer._id}, {$set:{"player.cost":offer}}) if offer > currentOffer

Template.bid.helpers
  currentOffering: -> parseInt(Current.findOne().player.cost) + 1
