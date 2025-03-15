#import "@preview/glossarium:0.5.0": make-glossary, print-glossary, gls, glspl

// color testing. this typ file produces a test file if you preview it
#let uio-fp-blue = color.rgb(52.5%, 64.2%, 96.9%)
#let uio-fp-light-blue = color.rgb(90.2%, 92.5%, 100.0%)

#let uio-fp-orange = color.rgb(99.2%, 79.6%, 52.9%)
#let uio-fp-light-orange = color.rgb(100.0%, 91.0%, 83.1%)

#let uio-fp-pink = color.rgb(98.4%, 40.0%, 40.0%)
#let uio-fp-light-pink = color.rgb(99.6%, 87.8%, 87.8%)

#let uio-fp-green = color.rgb(48.4%, 88.2%, 67.1%)
#let uio-fp-light-green = color.rgb(80.8%, 100.0%, 87.5%)

#let uio-fp-gray = color.luma(70.0%)
#let uio-fp-grey = color.luma(70.0%)

#let uio-fp-light-gray = color.luma(91.2%)
#let uio-fp-light-grey = color.luma(91.2%)

#square(fill: uio-fp-blue)
#square(fill: uio-fp-light-blue)
#square(fill: uio-fp-orange)
#square(fill: uio-fp-light-orange)
#square(fill: uio-fp-pink)
#square(fill: uio-fp-light-pink)
#square(fill: uio-fp-green)
#square(fill: uio-fp-light-green)
#square(fill: uio-fp-gray)
#square(fill: uio-fp-grey)
#square(fill: uio-fp-light-gray)
#square(fill: uio-fp-light-grey)

// here i am initializing all the images for the front page. i intend to make the thesis template work in norwegian/english, so we will need to change pics based on what the user chooses
#let uio-seal = ""

// note that there is a difference in size between the PNG and SVG file below. My excuse is that "it was like that when I stole it" from Dag's PhD template. 
#let uio-name-en = "uio-fp-navn-eng.svg"
#let uio-name-no = "uio-fp-navn-bm.png"

#place(top + left, dx: 2cm, dy: 1mm, image("uio-fp-segl.svg", width: 23.7mm))
#place(top + left, dx: 6cm, dy: 1mm, image("uio-fp-segl.svg", width: 23.7mm * 2))
#place(top + left, dx: 2cm, dy: 6cm, image("uio-fp-navn-bm.png", width: 25%))
#place(top + left, dx: 2cm, dy: 8cm, image("uio-fp-navn-nn.png", width: 25%))
#place(top + left, dx: 2cm, dy: 10cm, image("uio-fp-navn-eng.svg", width: 25%))

// i define a few easily changeable default variables below in case you don't want to pass in all the parameters.
#let default-title = "Typst - A LaTeX Alternative for Long Form Writing in Academia?"
#let default-subtitle = "An attempt at making an unofficial Typst template based on existing resources provided by the University of Oslo."
#let default-author = "Sebastian Huus"
#let default-program = "Programming and System Architecture"
#let default-credits = 60
#let default-dept = "Department of Informatics"
#let default-faculty = "Faculty of Mathematics and Natural Sciences"
#let default-thesis-type = "Bachelor's thesis"  // or Master's thesis, Doctor's thesis (Bacheloroppgave, Masteroppgave, Doktoroppgave),
#let default-lang = "en" // alternatively "no" for Norwegian. I have not added support for any other language.
#let default-date = "Fall 2024" // or Spring 2024, etc. You can also put in an actual date if you want. 
#let default-cover-page-font = "New Computer Modern Sans" // I chose this font based on the uiophdthesis. UiO's main fonts is actually licensed and costs money to use. 
#let default-cover-image = "" // optional
#let default-supervisors = (
    (
      name: "Ola Nordman",
      title: "Professor",
      department: "Department of Informatics",
      affiliation: "University of Oslo",
      email: "ola@ifi.uio.no",
    ),
    (
      name: "Jane Doe",
      title: "Head of Engineering",
      department: "Artemis",
      affiliation: "NASA",
      email: "jane.doe@nasa.gov",
    ),
    (
      name: "John Doebert",
      title: "Typesetting Engineer",
      affiliation: "Typst",
      email: "john.doebert@typst.app",
    ),
  )

/*
Note that this one is just to make the front page. If looking for 
*/
#let create_cover_page(
  title: default-title,
  subtitle: default-subtitle,
  author: default-author,
  program: default-program,
  credits: default-credits,
  dept: default-dept,
  faculty: default-faculty,
  thesis-type: default-thesis-type,
  lang: default-lang,  
  primary-color : uio-fp-blue,
  secondary-color : uio-fp-light-blue, 
  date: default-date, 
  cover-page-font:default-cover-page-font, 
  cover-image: default-cover-image,
  ) = {
    /* I decided to make a few functions to make the cover page so it is easy to understand what each block of code does. The idea was that I could take them out of the template and make some global functions that can be called in frontpage.typ so you can preview all the default colors */
    
    // This function sets the two-colored main + light combination for the classic UiO thesis look.
    let set_cover_colors(primary: uio-fp-blue, secondary: uio-fp-light-blue) = {
      // This decides how much of the page is in the primary vs secondary color. I found that a 30%-70% between primary/secondary looks about the same as the original templates. 
      let top-color-ratio = 30%
      let bottom-color-ratio = 100% - top-color-ratio
      stack(
        spacing: 0pt,
        // Top box (30%)
        box(
          width: 100%,
          height: top-color-ratio,
          fill: primary,
          if cover-image != "" {
            image(cover-image, width: 100%)
          }
        ),
        // Bottom box (70%)
        box(
          width: 100%,
          height: bottom-color-ratio,
          fill: secondary,
        )
      )
    }
    
    let place_thesis_type(content: "Bachelor's thesis") = {
      // place the grey box stating if this is a masters or bachelors thesis
      place(
        top + left,
        dy: 25%,
        dx: 1cm,
        box(outset: 0.75em, fill: black,text(fill: white, [*#content*]))
      )
    }
  
    let place_uio_name(lang: "en") = {
      // Place UIO name in the top left
      place(
        top + left,
        dy: 1cm,
        dx: 1cm,
    
        if lang == "no" {
          image(uio-name-no, width: 25%)
        } else {
          image(uio-name-en, width: 25%)
        }
      )
    }
  
    let place_uio_seal() = {
      // places the uio seal in the corner. the phd template lists the width as 23.7mm, so i have just offset the position starting from bottom right with the same amount and added a margin.
      place(
        bottom + right,
        dy: 1.5cm-23.7mm,
        dx: 1.5cm -23.7mm,
        image("uio-fp-segl.svg", width: 23.7mm)
      )
    }
  
    let place_date_text(date: "Fall 2024") = {
      // place the date / semester text
      place(
        bottom + left,
        dy: -1cm,
        dx: 1cm,
        text(date)
      )
    }
  
    // handles main text
    let place_cover_text(title: lorem(6), subtitle: lorem(10), author: lorem(2), program: lorem(3), credits: 60, dept: lorem(3), faculty: lorem(4)) = {
      place(
        top + left,
        dy: 35%,
        dx: 1cm,
        [
          // main title box. wraps to next line on half-page
          #box(width: 50%,
            [
              #text(size: 24pt, black)[#title] \ \
              #subtitle 
    
              #v(2em)
              
              *#author* 
    
              #v(2em)
              
              #program \ 
    
              #if lang == "no" [
                #credits studiepoeng \ \
              ] else [
                #credits credits \ \
              ]
              #dept \
              #faculty
            ]
          )
    
        ]
      )
    }

    set page(margin: 0pt)
    set text(font: cover-page-font)
    set_cover_colors(primary: primary-color, secondary: secondary-color)
    place_uio_name(lang: lang)
    place_thesis_type(content: thesis-type)
    place_uio_seal()
    place_date_text(date: date)
    place_cover_text(title: title, subtitle: subtitle, author: author, program: program, credits: credits, dept: dept, faculty: faculty)
  }

#let uiothesisfp(
  title: default-title,
  subtitle: default-subtitle,
  author: default-author,
  program: default-program,
  credits: default-credits,
  dept: default-dept,
  faculty: default-faculty,
  thesis-type: default-thesis-type,
  lang: default-lang,
  primary-color : uio-fp-blue,
  secondary-color : uio-fp-light-blue, 
  date: default-date,
  cover-page-font: default-cover-page-font,
  supervisors: default-supervisors,
  headSize: 24pt,
  abstract: lorem(60),
  preface: lorem(60),
  bibliography-file: none,
  bibliography-full: true, // Whether or not to cite sources that are not referenced in the document. 
  citation-style: "ieee",
  body,
) = {
  // call the function to create cover page
  create_cover_page(
    title: title,
    subtitle: subtitle,
    author: author,
    program: program,
    credits: credits,
    dept: dept,
    faculty: faculty,
    thesis-type: thesis-type,
    lang: lang,
    primary-color: primary-color,
    secondary-color: secondary-color,
    date: date,
    cover-page-font: cover-page-font,
  )
    
  // first page
  set page(margin: auto)
  pagebreak(weak: true)
  counter(page).update(1)
  set page(numbering: "i")

  // title w/ supervisors
  // this is repeated as the cover page is typically not considered part of the thesis. when printing, they usually make a new cover page and put your submitted thesis inside their front and back cover. 
  align(center, [

    #v(10%)
    #text(author, size: 1.3em, weight: "bold")

    #v(1em)
    
    #text(title, size: headSize)
    

  ])
  
  let supervisors-title = "Supervisor"
  if supervisors.len() >= 2 {
    supervisors-title = "Supervisors"
  }

  let grid-width = 3
  align(center + horizon, text(supervisors-title, size: 14pt, weight: "bold"))
  for i in range(calc.ceil(supervisors.len() / grid-width)) {
    let end = calc.min((i + 1) * grid-width, supervisors.len())
    let is-last = supervisors.len() == end
    let slice = supervisors.slice(i * grid-width, end)
    grid(
      columns: slice.len() * (1fr,),
      gutter: 12pt,
      ..slice.map(s => align(center, {
        text(size: 11pt, s.name)
        if "title" in s [
          \ #s.title
        ]
        if "department" in s [
          \ #s.department
        ]
        if "affiliation" in s [
          \ #s.affiliation
        ]
        if "email" in s {
          if type(s.email) == str [
            \ #link("mailto:" + s.email)
          ] else [
            \ #s.email
          ]
        }
      }))
    )

    if not is-last {
      v(16pt, weak: true)
    }
  }
  
  // preface starts here
  show heading: it => [
    #it.body
    #v(1em)
  ]
  set text(font: "Libertinus Serif")
  if abstract != "" {
    pagebreak(weak: true)
    [= Abstract]
    abstract
  }

  if preface != "" {
      pagebreak(weak: true)
    [= Preface]
    preface
  }

  // outline section starts here
  pagebreak(weak: true)
  
  outline()

  import "@preview/wordometer:0.1.3": word-count, total-words
  show: word-count
  [Total words: #total-words]
  
  // this section puts up a list of tables and or figures
  context {
    let amt-tables =  counter(figure.where(kind: table)).final().first()
    let amt-figures =  counter(figure.where(kind: image)).final().first()
    let amt-listings =  counter(figure.where(kind: image)).final().first()
    let sum-figures = amt-figures + amt-tables
    
    if (sum-figures > 0 and sum-figures <= 5) {
      // combined list of tables and figures
      // only if total length is less than 5
      let outline-title = if lang == "en" [List of Tables and Figures] else [Tabeller og figurer]
      outline(
        title: outline-title,
        target: figure
      )
    } else {
      if (amt-tables > 0) {
        // list of tables
        outline(
          title: [List of Tables],
          target: figure.where(kind: table)
        )
      }

      if (amt-figures > 0) {
        // list of figures
        // list of tables
        outline(
          title: [List of Figures],
          target: figure.where(kind: image)
        )
      }

      if (amt-listings > 0) {
        // list of figures
        // list of tables
        let listing-title = if lang == "en" [List of Listings] else [Utlistinger]
        outline(
          title: listing-title,
          target: figure.where(kind: code)
        )
      }
    }
  }

  // thesis starts here
  set page(numbering: "1")
  counter(page).update(1)

  set heading(numbering: "1.1")
  
  body

  if bibliography-file != none {
    pagebreak()
    bibliography(full: true, bibliography-file)
  } 
}

#uiothesisfp("")

