// CTU Bern, typst letter template
// André Moser
// Department of Clinical Research, University of Bern
// Some source https://github.com/LaPreprint/typst/blob/main/lapreprint.typ


#let ctu_typst_template(
  recipient: "Dr. Quartini Quarto",
  recipient_line1: "",
  recipient_line2: "",
  recipient_line3: "",
  recipient_line4: "",
  recipient_line5: "",
  subject: "Subject line",
  subject2: "",
  sender: "Dr. Ueli Reber",
  sender_title: "Head of Business Operations",
  sender_line1: "DCR",
  sender_line2: "",
  sender_line3: "",
  sender_line4: "",
  sender_line5: "",
  sender_line6: "www.dcr.unibe",
  department: "Department of Clinical Research",
  faculty: "Faculty of Medicine",
  path_logo: "/_extensions/dcr-unibe-ch/qmd_ctutypst_letter/",
  // logo_size: filename (fore example, "dcrlogo.jpg")
  logo: "DCRlogo.svg",
  // logo_size: percentage (for example, 80%) or auto
  logo_size: 100%,
  logo2: "UniBElogo.svg",
  // logo_size2: percentage (for example, 80%) or auto
  logo_size2: 40%,
  date: datetime.today(),
  paper-size: "a4",
  font-face: "Arial",
  include_sender_right: true,
  signoff: true,
  space_after_recipient: 50pt,
  body,
) = {

  // Spacer for footer
  let spacer = text(fill: gray)[#h(8pt) | #h(8pt)]

  // Set document metadata
  set document(title: subject)

  // Set the body font
  set text(font: font-face)

  // function to remove tildes
  let clean(s) = s.replace("~", " ")

  // function to conditionally add content
  let show-line(line, ..args) = {
    if line != "" {
      text(size: 8pt, ..args.named(), line)
      linebreak(justify: false)
      }
  }

  // Configure title page
  set page(
    paper-size,
    margin: (left: 3cm, right: 2cm, top: 3cm, bottom: 3cm),
    header: block(
      width: 100%,
      inset: (top: 1pt, right: 2pt),
      if (logo != none) {
        place(
          top+right,
          dy: -1.3cm,
          dx: 0cm,
          float: false,
        box(
          width: 27%,
          image(path_logo+logo, width: 130%)
        )
      )
      }
    ),
    footer: block(
      width: 100%,
      inset: (top: 1pt, right: 2pt),
      if (logo2 != none) {
        place(
          top+left,
          dx: 0cm,
          dy: -1cm,
          float: false,
        box(
          width: 40%,
          height: 100%,
          image(path_logo+logo2, width: 40%)
        )
      )
      }
    ),
  )

// Right margin of letter

place(
  right,
  dx: 0mm,  // shift into the margin
  dy: 17mm
)[
  #set align(left)
  #text(size: 8pt, weight: "bold")[#faculty]
  #linebreak( justify: false)
  #text(size: 8pt)[#department]
  //#linebreak( justify: false)
  #v(-10pt)
  #if include_sender_right {
    show-line(clean(sender), weight: "bold")
    show-line(sender_title)
    show-line(sender_line1)
    show-line(sender_line2)
    show-line(sender_line3)
    show-line(sender_line4)
    show-line(sender_line5)
    v(2pt)
  } else {
    v(10pt)
  }
  #text(size: 8pt)[#sender_line6]
  ]

  v(10pt)

  // Set header address and recipient
  set align(left)
  text(size: 7pt)[#underline[#sender_line1, #sender_line2, #sender_line3, #sender_line4]]
  v(20pt)
  show-line(clean(recipient))
  //linebreak( justify: false)
  //text(size: 8pt, recipient_line1)
  //linebreak( justify: false)
  //text(size: 8pt, recipient_line2)
  //linebreak( justify: false)
  //text(size: 8pt, recipient_line3)
  //linebreak( justify: false)
  //text(size: 8pt, recipient_line4)
  //linebreak( justify: false)
  //text(size: 8pt, recipient_line5)
  show-line(recipient_line1)
  show-line(recipient_line2)
  show-line(recipient_line3)
  show-line(recipient_line4)
  show-line(recipient_line5)
  v(space_after_recipient)

  // Place and date
  text(size: 10pt, "Bern, ")
  text(size: 10pt, date.display("[day] [month repr:long] [year]"))
  v(10pt)

  // Subject
  text(size: 12pt, weight: "bold")[#subject]
  if(subject2 != ""){
    linebreak(justify: false)
    text(size: 10pt, weight: "bold")[#subject2]
  }
  v(10pt)

  // Letter
  //text(size: 10pt)[Dear #clean(recipient)]
  //v(10pt)
  text(size: 10pt)[#body]
  if(signoff){
    v(10pt)
    text(size: 10pt)[Kind regards]
    linebreak( justify: false)
    linebreak( justify: false)
    text(size: 10pt)[#clean(sender)]
    linebreak( justify: false)
    text(size: 10pt)[#sender_title]
  }

}
