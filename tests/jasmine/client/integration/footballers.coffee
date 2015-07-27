describe "When starting", () ->
  it "should show an empty footballer", () ->
    expect($('.name').text()).toBe ""

describe "When the admin is logged in", () ->
  it "she can see dropdown list and draw button", ->
    Meteor.loginWithPassword "admin@fantanarchist.com", "adidas", (err) ->
      expect($('.roles')).not.toBeNull
      Meteor.logout ->
        done()