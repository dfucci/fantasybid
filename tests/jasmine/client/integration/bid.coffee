describe "When a draw is made", ->
  it "should show the value offered", ->
    $(".offer").click()
    offering = $(".offering").text()
    expect($(".offered").text()).not.toBe ""
    expect($(".offered").text()).toBe offering
