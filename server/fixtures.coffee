if Footballers.find().count() == 0
 _.shuffle([
    {name: "Francesco Totti", team: "Roma", role: "F"}
    {name: "Mauro Icardi", team: "Inter", role: "F"}
    {name: "Gigi Buffon", team: "Juventus", role: "G"}
  ]).forEach (data) ->
      Footballers.insert data
