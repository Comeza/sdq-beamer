#import "colors.typ": *
#import "vars.typ": kit-corner-radius

#let infobox(title, color: kit-green, width: 100%, body) = box(width: width, {
    set par(justify: true)
    let inset = 0.6em

    stack(
      block(
        inset: inset,
        fill: color,
        width: width,
        radius: (top-right: kit-corner-radius),
        text(fill: white, strong(title)),
      ),
      block(
        inset: (rest: inset, left: inset * 2),
        fill: color.lighten(90%),
        width: width,
        radius: (bottom-left: kit-corner-radius),
        body,
      ),
    )
  },
)

#let greenbox = infobox.with(color: kit-green)
#let purplebox = infobox.with(color: kit-purple)
#let bluebox = infobox.with(color: kit-blue)
#let redbox = infobox.with(color: kit-red)
