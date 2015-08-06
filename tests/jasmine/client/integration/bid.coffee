describe "When a bid is made", ->
  beforeEach (done) ->
    Meteor.loginWithPassword "admin@fantanarchist.com", "123456", (err) ->
      $(".roles").val("G")
      $(".draw").click()
      Meteor.logout ->
        done()

  it "a bid participant should be logged in", (done) ->
    Meteor.loginWithPassword "davide@fantanarchist.com", "123456", (err) ->
      expect(err).toBeUndefined()
      $(".offering").val(8)
      $(".offer").click -> expect($(".cost").text()).toBe "8"
      Meteor.logout ->
        done()

  it "cannot bid a value less than the actual one", (done) ->
    Meteor.loginWithPassword "davide@fantanarchist.com", "123456", (err) ->
      expect(err).toBeUndefined()
      $('.offering').val 8
      $('.offer').click ->
        $('.offering').val 6
        $('.offer').click ->
          expect($('.cost').text()).toBe "8"
      Meteor.logout ->
        done()

  describe "and the bidding is stopped", ->
    it "assignes the player to the higher bidder", ->
