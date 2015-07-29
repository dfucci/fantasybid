Template.bid.events
  'click .offer': (e, tpl) ->
    e.preventDefault()
    cPlayer = Current.findOne()
    offer = tpl.$('.offering').val()
    Current.update({_id:cPlayer._id}, {$set:{"player.cost":offer}})

