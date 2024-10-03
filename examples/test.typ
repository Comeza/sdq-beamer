#import "/src/lib.typ": *

#show: slides.with(
    no: 1,
    series: [Präsentation mit Typst Beamer im KIT-Design],
    title: [entsprechend den Gestaltungsrichtlinien vom 1. August 2020, mit anpassungen für Typst],
    faculty: [Hurensohn Institut],

    author: "Max Mustermann",
    email: link("mailto:example@example.com"),
)

#slide[
    #greenbox("Greenbox")[
      - Das KIT ist toll
      - Das KIT ist toll
      - Das KIT ist toll
    ]

    #bluebox("Passiert")[
        lol
    ]

    #redbox("gaming")[
        lol
    ]
]
