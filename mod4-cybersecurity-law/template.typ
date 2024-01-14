#let kthblue = rgb("#2258a5")
#let stylize_link(it) = underline(stroke: 1pt + kthblue, text(fill: kthblue, it))

#let cover_page(title: none, subtitle: none, date: none) = {
  set page("a4")
  set text(12pt)
  show link: stylize_link
  show heading: set block(above: 1.4em, below: 1em)

  align(center + horizon)[
    #image("KTH_logo_RGB_bla.svg", height: 100pt)

    #v(20pt)

    #heading(outlined: false)[#title]
    #heading(
      outlined: false,
      level: 2,
    )[#text(weight: "regular", style: "italic")[#subtitle]]

    #v(20pt)

    #heading(
      outlined: false,
      level: 2,
    )[DD2510 Cybersecurity in a Socio-Technical Context]
    #heading(outlined: false, level: 3)[Module 4: Cybersecurity Law]

    #v(20pt)

    #align(center)[
      Rafael Oliveira\
      #link("mailto:rmfseo@kth.se")
    ]

    #v(20pt)

    #smallcaps[#date]

    KTH Royal Institute of Technology
  ]
}

#let header(title: none) = {
  set text(10pt)
  smallcaps[#title]
  h(1fr)
  smallcaps[DD2510 - Module 4]
  line(length: 100%, stroke: 0.5pt + rgb("#888"))
}

#let footer = {
  set align(right)
  set text(10pt)
  line(length: 100%, stroke: 0.5pt + rgb("#888"))
  smallcaps[Rafael Serra e Oliveira]
  h(1fr)
  [Page ]
  counter(page).display("1 of 1", both: true)
}

#let setup_page(content) = {
  show link: stylize_link
  set par(justify: true)
  set heading(numbering: "1.1.")

  content
}
