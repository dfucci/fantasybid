describe "main", () ->
  describe "template", () ->
    it "contains Welcome message", () ->
      expect($('h1').text()).toEqual "Welcome"