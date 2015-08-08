Meteor.publish 'footballer', -> Current.find()
Meteor.publish 'teams', -> Meteor.users.find({}, {fields: {emails:1, profile:1}})
