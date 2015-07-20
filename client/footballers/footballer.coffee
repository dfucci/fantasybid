Meteor.subscribe 'footballers'

Template.footballer.helpers
  player: () -> Session.get "currentPlayer"