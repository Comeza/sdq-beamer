#let semester(short: false, date) = {
  let wise = (long: "Wintersemester", short: "WiSe").at(if short {
    "short"
  } else {
    "long"
  })

  let sose = (long: "Sommersemester", short: "SoSe").at(if short {
    "short"
  } else {
    "long"
  })

  let sem = wise

  let year = if date.month() < 4 or date.month() > 9 {
    date.year() - 1
  } else {
    sem = sose
    date.year()
  }

  [#sem ]

  if sem == wise {
    [#year/#(year + 1)]
  } else {
    [#year]
  }
}

#let days-de = (
    "Montag",
    "Dienstag",
    "Mittwoch",
    "Donnerstag",
    "Freitag",
    "Samstag",
    "Sonntag",
  )

#let days-en = (
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  )

#let days = context if text.lang == "de" { days-de } else { days-en }

#let weekday(short: false, daynr) = {
  let day = days.at(daynr - 1)

  if short {
    day = day.slice(0, 2)
  }

  day
}
