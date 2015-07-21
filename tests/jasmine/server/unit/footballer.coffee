describe "drawPlayer", () ->
  it 'should return a player when one exits', () ->
    spyOn Footballers, "find"
    expect(Meteor.methodMap.drawPlayer).toThrow
