#import "colors.typ": *
#import "vars.typ": kit-corner-radius

#let infobox(title, color: kit-green, width: 80%, body) = {
    set par(justify: true)
    set text(size: 18pt)

    let width = 80%
    let inset = 0.6em

    stack(
      block(
        inset: inset,
        width: width,
        fill: color,
        radius: (top-right: kit-corner-radius),
        text(fill: white, strong(title))),
      block(
        width: width,
        inset: (rest: inset, left: inset*2),
        fill: color.lighten(90%),
        radius: (bottom-left: kit-corner-radius),
        body)
    )
}

#let greenbox(title, body) = infobox(title, color: kit-green, body)
#let bluebox(title, body)  = infobox(title, color: kit-blue, body)
#let redbox(title, body)   = infobox(title, color: kit-red, body)
