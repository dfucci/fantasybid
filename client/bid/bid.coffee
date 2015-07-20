Meteor.subscribe 'footballers'

Template.bid.helpers
  remaining: -> Footballers.find({role: Session.get("role")}).count()

Template.bid.events
  "change .roles": (e, tpl) ->
    e.preventDefault()
    Session.set "role", tpl.$("select[name='role']").val()

  "click .draw": (e, tpl) ->
    e.preventDefault()
    role = tpl.$("select[name='role']").val()
    Meteor.call "drawPlayer", role, (error, response) ->
      if error
        alert error.reason
      Session.set "currentPlayer", response