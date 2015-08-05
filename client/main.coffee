Meteor.subscribe 'footballer'
UI.registerHelper "current", -> Current.find().fetch()[0]

Template.main.helpers
  loggedIn: -> Meteor.userId()?