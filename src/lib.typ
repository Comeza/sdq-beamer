#import "@preview/polylux:0.3.1"
#import "@preview/hydra:0.5.1": hydra

#import "dates.typ": semester, weekday
#import "colors.typ": *
#import "box.typ": *
#import "vars.typ": *
#import "variants/default.typ": *
#import "variants/title-page.typ": *

#let unbreak(body) = {
  set text(hyphenate: false)
  body
}

#let uncover = polylux.uncover
#let only = polylux.uncover
#let pause = polylux.pause

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

  show footnote.entry: set text(size: 0.8em, fill: black.lighten(20%))
  set heading(numbering: none)
  show heading: set text(size: 18pt)

  set text(size: 18pt, font: "Roboto")

  let footer-info = context {
    set text(10pt)
    let loc = here()
    let current = counter(page).at(loc).first() - 1
    let last = counter(page).final(loc).first() - 1

    let author = slide-author.get()
    let series = slide-series.get()
    let faculty = slide-faculty.get()

    line(length: 100%, stroke: 1pt + kit-gray)
    [ *#current/#last* #h(0.1fr) #get-date #h(0.1fr) #author: #series #h(1fr) #faculty ]
  }

  let header = context {
    let page = here().position().page
    block(
      height: 100%,
      width: 100%,
      inset: (right: 1cm),
      stack(
        spacing: 1fr,
        dir: ltr,
        text(
          weight: "bold",
          size: 24pt,
          hydra(1),
        ),
        kit-logo(height: 100% - 1cm),
      ),
    )
  }

  let ratio = (
    "16:9": "presentation-16-9",
    "4:3": "presentation-4-3",
  ).at(aspect-ratio)

  set page(
    paper: ratio,
    fill: white,
    margin: (top: 4cm, left: 1cm),
    header: header,
    footer: footer-info,
  )

  body
}
