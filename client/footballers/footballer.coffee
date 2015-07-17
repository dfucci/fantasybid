Meteor.subscribe 'footballers'

Template.footballer.helpers
    remaining: -> Footballers.find().count()