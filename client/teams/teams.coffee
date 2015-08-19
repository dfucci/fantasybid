Template.teams.helpers
  users: ->
    Meteor.users.find().fetch()