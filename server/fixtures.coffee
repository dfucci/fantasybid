if Footballers.find().count() == 0
  [
    {name: "Francesco Totti", team: "Roma"}
    {name: "Mauro Icardi", team: "Inter"}
  ].forEach (data) -> Footballers.insert data