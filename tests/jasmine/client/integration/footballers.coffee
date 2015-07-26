describe "When starting", () ->
  it "should show an empty footballer", () ->
    expect($('.name').text()).toBe ""
  it "should show the number of all footballers to be extracted", () ->
    expect(parseInt($('.remaining').text())).toBeGreaterThan 0

describe "When extracting a new football player", () ->
  it "a player should be in Session", () ->
    expect(Session.get('currentPlayer')).not.toBeNull

  it "should decrease the number of remaining", () ->
    currentRemaining = parseInt($('.remaining').text())
    remaining = parseInt($('.remaining').text())
    expect(remaining).toBe currentRemaining - 1
    pending()

describe "when the admin is logged in", ->
  it "she can see dropdown list and draw button"
  pending()