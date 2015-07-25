Template.bid.events
  "change .roles": (e, tpl) ->
    e.preventDefault()
    role = tpl.$("select[name='role']").val()
    if role isnt "A"
      Meteor.call 'remainingPlayers', role, (err, res) ->
        alert err.reason if err
    tpl.$(".remaining").text "" if role is "A"


  "click .draw": (e, tpl) ->
    e.preventDefault()
    role = tpl.$("select[name='role']").val()
    if role isnt "A"
      Meteor.call "drawFootballer", role, (error, response) ->
        alert error.reason if error
    tpl.$(".draw").prop("disabled", true) unless parseInt(tpl.$(".remaining").text()) is 0