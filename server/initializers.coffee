Accounts.onCreateUser (options, user) ->
  user.profile = {} if user.profile is undefined
  _.extend user.profile, {"credits": 300}
  user
