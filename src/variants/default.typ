#import "/src/vars.typ": *
#import "/src/colors.typ": *
#import "@preview/polylux:0.4.0"

#let slide(title: none, ..args) = {
    let header = context {
      let page = here().position().page
      block(
        height: 100%,
        width: 100%,
        stack(
          spacing: 1fr,
          dir: ltr,
          text(
            weight: "bold",
            size: 26pt,
            title,
          ),
          if page > 1 { kit-logo(height: 100% - 1cm) }
        ),
      )
    }


    let footer-info = context {
      set text(10pt)
      let loc =  here() 
      let current = counter(page).at(loc).first() - 1
      let last = counter(page).final().first() - 1

      let author = slide-author.get()
      let series = slide-series.get()
      let faculty = slide-faculty.get()

      line(length: 100%, stroke: 1pt + kit-gray)
      [ *#current/#last* #h(0.1fr) #get-date #h(0.1fr) #author: #series #h(1fr) #faculty ]
    }


    set page(
      header: header,
      footer: footer-info,
    )

    polylux.slide(..args)
    counter("slide-counter").step()
}


