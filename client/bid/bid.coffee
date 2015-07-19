Meteor.subscribe 'footballers'
Template.bid.helpers
  remaining: -> Footballers.find({role: Session.get("role")}).count()

Template.bid.events
  "change .roles": (e, tpl) ->
    e.preventDefault()
    Session.set "role", tpl.$("select[name='role']").val()
