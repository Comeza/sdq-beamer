#import "@preview/polylux:0.4.0"
#import "@preview/hydra:0.6.1": hydra

#import "dates.typ": semester, weekday
#import "colors.typ": *
#import "box.typ": *
#import "vars.typ": *
#import "variants/default.typ": *
#import "variants/title-page.typ": *
#import "variants/center-page.typ": *


#let unbreak(body) = {
  set text(hyphenate: false)
  body
}

#let uncover = polylux.uncover
#let only = polylux.uncover

#let slides(
  no: 0,
  series: none,
  title: none,
  author: none,
  email: none,
  faculty: none,
  show-semester: true,
  show-outline: true,
  date: datetime.today(),
  aspect-ratio: "16:9",
  body,
) = {
  slide-no.update(no)
  slide-title.update(title)
  slide-series.update(series)
  slide-author.update(author)
  slide-email.update(email)
  slide-faculty.update(faculty)
  slide-date.update(date)

  let ratio = (
    "16:9": "presentation-16-9",
    "4:3": "presentation-4-3",
  ).at(aspect-ratio)

  show footnote.entry: set text(size: 0.8em, fill: black.lighten(20%))
  show heading: set text(size: 18pt)
  show link: it => {
    set text(fill: kit-blue)
    underline(it)
  }

  set heading(numbering: none)
  set text(size: 16pt, font: "Roboto")

  set page(
    paper: ratio,
    fill: white,
    margin: (top: 4cm, left: 1cm, right: 1cm),
  )

  body
}
