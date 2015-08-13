Current.remove({})

if Footballers.find().count() == 0
 _.shuffle([
   {name: "Francesco Totti", team: "Roma", role: "F"},
   {name: "Mauro Icardi", team: "Inter", role: "F"},
   {name: "Marco Materazzi", team: "Inter", role: "D"},
   {name: "Ale Nesta", team: "Milan", role: "D"},
   {name: "Daniele DeRossi", team: "Roma", role: "M"},
   {name: "Darko Kuzmanovic", team: "Inter", role: "M"},
   {name: "Gigi Buffon", team: "Juventus", role: "G"},
   {name: "Sergio Romero", team: "Sampdoria", role: "G"}
  ]).forEach (data) ->
      Footballers.insert data

