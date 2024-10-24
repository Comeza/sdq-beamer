#let kit-slogan = context if text.lang == "de" {
  [KIT -- Die Forschungsuniversität in der Helmholtz-Gemeinschaft]
} else {
  [KIT -- The Research University in the Helmholtz Association]
}


#let kit-logo(height: 2.5cm) = {
  context if text.lang == "de" {
    image("/logos/logo_kit_de.svg", height: height)
  } else {
    image("/logos/logo_kit_en.svg", height: height)
  }
}

#let kit-corner-radius = 15pt



// Number of the Presentation
#let slide-no = state("slide-title", none)

// Title of the Current Presentation "Classes & Objects"
#let slide-title = state("slide-title", none)

// Title of the Overal Series e.g. "Java I"
#let slide-series = state("slide-series", none)

// Author of the Presentation e.g. "David Hume"
#let slide-author = state("slide-author", none)

// Email of the Author
#let slide-email = state("slide-email", none)

// Faculty
#let slide-faculty = state("slide-faculty", none)

// Date of the presentation
#let slide-date = state("slide-date", datetime.today())

// Date format of the presentation
#let slide-date-fmt = state("slide-date-fmt", "[day]. [month repr:long] [year]")

#let get-date = context slide-date.get().display(slide-date-fmt.get())
