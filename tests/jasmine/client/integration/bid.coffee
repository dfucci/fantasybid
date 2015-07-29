describe "When a draw is made", ->
  it "should show the value offered", ->
    offering = $(".offering").val(8)
    $(".offer").click()
    expect($(".offered").text()).not.toBe ""
    expect($(".offered").text()).toBe offering
