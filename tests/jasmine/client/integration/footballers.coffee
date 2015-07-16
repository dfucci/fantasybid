describe "When starting", () ->
  it "should show an empty footballer", () ->
    expect($('.name').text()).toBe("")