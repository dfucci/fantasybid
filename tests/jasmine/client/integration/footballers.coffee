describe "When starting", () ->
  it "should show an empty footballer", () ->
    expect($('.name').text()).toBe ""
  it "should show the number of all footballers to be extracted", () ->
    expect(parseInt($('.remaining').text())).toBe 2