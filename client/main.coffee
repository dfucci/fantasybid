Meteor.subscribe 'footballer'
UI.registerHelper "current", -> Current.find().fetch()[0]