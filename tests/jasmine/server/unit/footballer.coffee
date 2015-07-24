describe "drawFootballer", () ->
  it 'should return a player when one exits', () ->
    spyOn Footballers, "find"
    expect(Meteor.methodMap.drawFootballer).toThrow
