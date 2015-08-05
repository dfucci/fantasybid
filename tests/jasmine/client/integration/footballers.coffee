describe "When starting", () ->
  it "should show an empty footballer", () ->
    expect($('.name').text()).toBe ""

describe "When the admin is logged in", () ->
  it "she can see dropdown list and draw button", (done) ->
    Meteor.loginWithPassword "admin@fantanarchist.com", "adidas85", (err) ->
      expect($('.roles')).not.toBeNull
      Meteor.logout ->
        done()