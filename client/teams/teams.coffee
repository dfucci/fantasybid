UI.registerHelper 'formatEmail', (context, options) ->
  if context
    s(context.split("@")[0]).capitalize().value()

Template.teams.helpers
  users: ->
    Meteor.users.find().fetch()

