Meteor.subscribe 'footballers'
Template.bid.helpers
  remaining: -> Footballers.find().count()