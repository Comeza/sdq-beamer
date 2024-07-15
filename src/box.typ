#import "colors.typ": *

#let important-box(title,
    body,
    extra,
    primary-color,
    secondary-color,
    tertiary-color,
    dotted: false) = {

    set par(justify: true)
    block(width: 100%,
        inset: 1em,
        fill: secondary-color,

        stroke: (left: (thickness: 5pt,
            paint: primary-color,
            dash: if dotted { "dotted" } else { "solid" })),


        text(size: 0.75em, strong(text(fill: tertiary-color, smallcaps(title))))
        // + place(dx: 90%, dy: -0.5cm, text(size: 4em, fill: primary-color.lighten(75%), strong(extra)))
        + block(body))
}

#let standard-box-translations = (
    "definition": [Definition],
    "hint": [Hint],
    "solution": [Suggested solution],
    "notice": [Notice!],
    "example": [Example],
    "info": [Info]
)

#let definition(body) = {
    important-box(locate(loc => state("grape-suite-box-translations", standard-box-translations).final(loc).at("definition")),
        body,
        [D],
        kit-green,
        kit-green.lighten(90%),
        kit-green)
}

#let notice(body) = {
    important-box(locate(loc => state("grape-suite-box-translations", standard-box-translations).final(loc).at("notice")),
        body,
        [!],
        kit-green,
        kit-green.lighten(90%),
        kit-green,
        dotted: true)
}

#let example(body) = {
    important-box(locate(loc => state("grape-suite-box-translations", standard-box-translations).final(loc).at("example")),
        body,
        [B],
        kit-yellow,
        kit-yellow.lighten(90%),
        kit-brown,
        dotted: true)
}

#let info(body) = {
    important-box(locate(loc => state("grape-suite-box-translations", standard-box-translations).final(loc).at("info")),
        body,
        [I],
        kit-yellow,
        kit-yellow.lighten(90%),
        kit-brown,
        dotted: false)
}
