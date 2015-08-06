Template.bid.events
  'click .offer': (e, tpl) ->
    e.preventDefault()
    currentOffer = parseInt(Current.findOne().cost)
    cPlayer = Current.findOne()
    offer = tpl.$('.offering').val()
    Current.update({_id:cPlayer._id}, {$set:{"cost":offer}}) if offer > currentOffer

Template.bid.helpers
  currentOffering: -> parseInt(Current.findOne().cost) + 1
