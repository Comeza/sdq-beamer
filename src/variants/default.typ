#import "../vars.typ": *
#import "@preview/polylux:0.3.1"

#let slide(title: none, ..args) = (
  polylux.polylux-slide(..args) + counter("slide-counter").step()
)
