Tracker.autorun ->
  Meteor.subscribe 'footballer'
  Meteor.subscribe 'teams'

UI.registerHelper "current", -> Current.find().fetch()[0]

Template.main.helpers
  loggedIn: -> Meteor.userId()?