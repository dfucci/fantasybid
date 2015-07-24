Template.bid.events
  "change .roles": (e, tpl) ->
    e.preventDefault()

  "click .draw": (e, tpl) ->
    e.preventDefault()
    role = tpl.$("select[name='role']").val()
    Meteor.call "drawFootballer", role, (error, response) ->
      if error
        alert error.reason
