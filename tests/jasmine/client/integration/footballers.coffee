describe "When starting", () ->
  it "should show an empty footballer", () ->
    expect($('.name').text()).toBe ""
  it "should show the number of all footballers to be extracted", () ->
    expect(parseInt($('.remaining').text())).toBeGreaterThan 0

describe "When extracting a new football player", () ->
  it "a player is in Session", () ->
    expect(Session.get('currentPlayer')).not.toBeNull