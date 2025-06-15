#import "../vars.typ": *
#import "default.typ": *

#import "@preview/polylux:0.4.0"
#import "@preview/hydra:0.6.1": hydra

#let title-slide(
  banner-path: "/logos/banner_2020_kit.jpg",
) = {
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
      ),
    )
  }

  let footer = context {
    set text(10pt)
    let page = here().position().page
    let slogan = link(
      "https://kit.edu",
      text(weight: "bold", size: 16pt, [www.kit.edu]),
    )

    block(
      height: 1cm,
      align(horizon, stack(dir: ltr, spacing: 1fr, text(kit-slogan), slogan)),
    )
  }

  set page(
    header: header,
    footer: footer,
    margin: (bottom: 1.7cm, rest: 3mm),
  )

  let banner = box(
    clip: true,
    radius: (top-right: 15pt, bottom-left: 15pt),
    image(height: 7cm, width: 100%, banner-path),
  )

  let caption = context {
    let series = slide-series.get()

    block(
      height: 2.8cm,
      align(
        horizon,
        text(
          size: 24pt,
          weight: "bold",
          series,
        ),
      ),
    )
  }

  let subtitle = context {
    let title = slide-title.get()
    let author = slide-author.get()

    block(
      height: 1.4cm,
      align(
        top,
        stack(
          spacing: 1em,
          text(size: 14pt, weight: "bold", title),
          text(size: 14pt, weight: "regular", [ #author | #get-date ]),
        ),
      ),
    )
  }

  // Caption and subtitle
  let title-headings = box(
    width: 1fr,
    inset: (right: 0mm, rest: 7mm),
    stack(
      kit-logo(height: 2.5cm),
      caption,
      subtitle,
    ),
  )

  // Title page
  slide(
    box(
      stack(
        title-headings,
        banner,
      ),
    ),
  )
}
