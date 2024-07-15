#import "@preview/polylux:0.3.1"

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

    box-hint-title: standard-box-translations.at("hint"),
    box-solution-title: standard-box-translations.at("solution"),
    box-definition-title: standard-box-translations.at("definition"),
    box-notice-title: standard-box-translations.at("notice"),
    box-example-title: standard-box-translations.at("example"),
    box-info-title: standard-box-translations.at("info"),

    date: datetime.today(),
    body
) = {
    show footnote.entry: set text(size: 0.5em)
    show heading: set text(fill: kit-green)

    set text(size: 10pt, lang: "de", font: "Arial")

    let header = { (locate(loc => if loc.page() > 1 { image(kit-logo) })) }

    let footer_title_page = block(height: 1cm,
      align(horizon,
        stack(dir: ltr, spacing: 1fr,
          text(kit-slogan),
          text(weight: "bold", size: 16pt, [www.kit.edu])
        )
      )
    )

    let footer_rest = {}

    let footer = (locate(loc => if loc.page() == 1 { footer_title_page } else { footer_rest }));

    set page(
      paper: "presentation-16-9",
      header: header,
      footer: footer,
      margin: (bottom: 1.8cm, rest: 3mm)
    )


    state("grape-suite-box-translations").update((
        "info": box-info-title,
        "hint": box-hint-title,
        "solution": box-solution-title,
        "definition": box-definition-title,
        "notice": box-notice-title,
        "example": box-example-title,
    ))

    slide(box(stack(
      box(width: 1fr, inset: (right: 0mm, rest: 7mm), stack(
        stack(dir: ltr, spacing: 1fr, image(height: 2.6cm, kit-logo)),
        block(height: 2cm, align(horizon, text(size: 24pt, weight: "bold", series))),
        block(height: 2cm, align(horizon, stack(spacing: 1.5em,
          text(size: 14pt, weight: "semibold", title),
          text(size: 14pt, weight: "regular", [ #author | #date.display("[day]. [month repr:long] [year]") ])
        ))),
      )),
      box(clip: true, radius: (top-right: 20pt, bottom-left: 20pt), image(height: 7cm, width: 100%, "/logos/banner_2020_kit.jpg"))
    )))

    set page(fill: white)
    body
}
