describe "When the main page is loaded", () ->
  it "contains Welcome message", () ->
    expect($('h1').text()).toEqual "Welcome"

describe "When the user is logged out", ->
  it "should not show the bidding controls", (done) ->
    Meteor.logout ->
      expect($(".offering").val()).toBeUndefined
      expect($(".offer").text()).toBe ""
      done()