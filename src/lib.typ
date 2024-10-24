#import "@preview/polylux:0.3.1"
#import "@preview/hydra:0.5.1": hydra

#import "dates.typ": semester, weekday
#import "colors.typ": *
#import "box.typ": *
#import "vars.typ": *

#let unbreak(body) = {
    set text(hyphenate: false)
    body
}

#let uncover = polylux.uncover
#let only = polylux.uncover
#let pause = polylux.pause
#let slide(..args) = polylux.polylux-slide(..args) + counter("slide-counter").step()

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
    datefmt: "[day]. [month repr:long] [year]",
    body
) = {
    show footnote.entry: set text(size: 0.8em, fill: black.lighten(20%))
    set heading(numbering: none)
    show heading: set text(fill: kit-blue, size: 18pt)
    let date-fmt = date.display(datefmt)

    set text(size: 18pt, lang: "de", font: "Roboto")

    let header = context {
        let page = here().position().page
        if page > 1 {
            block(height: 100%, width: 100%, inset: (right: 1cm),
            stack(spacing: 1fr, dir: ltr,
                (text(weight: "bold", size: 24pt)[#context { hydra(1) }]),
                image(height: 100% - 1cm, kit-logo))
            )
        }
    }

    let footer_title_page = context {
        let page = here().position().page
        let slogan = if page == 1 {
                link("https://kit.edu", text(weight: "bold", size: 16pt, [www.kit.edu]))
            } else {
                text(faculty)
            }

        block(height: 1cm,
          align(horizon,
            stack(dir: ltr, spacing: 1fr,
              text(kit-slogan),
              slogan
            )
          )
        )
    }

    let footer_rest() = context {
        let loc = here()
        let current = counter(page).at(loc).first() - 1
        let last = counter(page).final(loc).first() - 1

        line(length: 100%, stroke: 1pt + kit-gray)
      [ *#current/#last* #h(0.1fr) #date-fmt #h(0.1fr) #author: #series #h(1fr) #faculty ]
    }

    let footer = context {
        let page = here().position().page
        if page == 1 { footer_title_page } else { footer_rest }
    }

    set page(
      paper: "presentation-16-9",
      header: header,
      footer: { set text(10pt); footer },
      margin: (bottom: 1.7cm, rest: 3mm)
    )



    slide(box(stack(
      box(width: 1fr, inset: (right: 0mm, rest: 7mm), stack(
        stack(dir: ltr, spacing: 1fr, image(height: 2.5cm, kit-logo)),
        block(height: 2.8cm, align(horizon, text(size: 24pt, weight: "bold", series))),
        block(height: 1.4cm, align(top, stack(spacing: 1em,
          text(size: 14pt, weight: "bold", title),
          text(size: 14pt, weight: "regular", [ #author | #date-fmt ]) // typst does not support localization currently
        ))),
      )),
      box(clip: true, radius: (top-right: 15pt, bottom-left: 15pt), image(height: 7cm, width: 100%, "/logos/banner_2020_kit.jpg"))
    )))

    set page(fill: white, margin: (top: 4cm, left: 1cm))
    body
}
