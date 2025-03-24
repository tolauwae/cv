// Colour scheme

#let highlight = rgb(32, 159, 181)
#let subdued = rgb(92, 95, 119)

// Socials

#let social(url, icon, body) = [
    #show link: set text(weight: 500)
    #link(url, grid(columns: 2, align: alignment.horizon, column-gutter: 3pt, image(icon, width: 1em, height: 1em), body))
]

#let linkedin(id, color: rgb(0,0,0)) = { 
    social("https://linkedin.com/in/" + id, "icons/linkedin.svg", "")
}

#let github(id, color: rgb(0,0,0)) = {
    social("https://github.com/" + id, "icons/github.svg", "")
}

#let homepage(id, color: rgb(0,0,0)) = {
    social(id, "icons/homepage.svg", "")
}

#let mail(id, color: rgb(0,0,0)) = {
    social("mailto:" + id, "icons/mail.svg", id)
}

#let phone(number, color: rgb(0, 0, 0)) = [
    #grid(columns: 2, align: alignment.horizon, column-gutter: 3pt, image("icons/phone.svg", width: 1em, height: 1em), number)
]

#let researchgate(id, color: rgb(0,0,0)) = {
    social("https://researchgate.net/profile/" + id, "icons/researchgate.svg", "")
}

#let googlescholar(id, color: rgb(0,0,0)) = {
    social(id, "icons/google-scholar.svg", "")
}

#let orcid(id, color: rgb(0,0,0), full: false) = {
    social("https://orcid.org/" + id, "icons/orcid.svg", [#if full [#id] else []])
}

// Building blocks

#let item(head, quiet, description, oneline: false, url: none, artifact: none, docs: none) = [
    #let emphasize(addendum: [], body) = [
        #block(above: 1.2em, below: 0.7em)[
            #let content = ()
            #if oneline {
                content.push([#text(weight: 700)[#body] #text(fill: subdued, style: "italic")[#sym.dot.op #addendum]])
            } else {
                content.push([#text(weight: 700)[#body]])
            }
            #if url != none {
            content.push([
                #link(url, image("icons/pdf.svg", height: 1em))  // todo add pdf logo/
            ])}
            #if artifact != none {content.push([
                #link(artifact, image("icons/git.svg", height: 1em))  // todo add pdf logo
            ])}
            #if docs != none {
            content.push([
                #link(docs, image("icons/docs.svg", height: 1em))])
            }
            #grid(columns: 4, align: alignment.horizon, column-gutter: 3pt, ..content)
        ]
    ]

    #show heading: set block(below: 0.7em)

    #if oneline [
        #emphasize(addendum: quiet, head)
    ] else [
        #emphasize(head)
        #text(fill: subdued, style: "italic", quiet)
    ]
    #v(0.1em)
    #description
]

#let experience(employer, role, start, end, description, oneline: false) = [
    #show heading: set block(below: 0.7em)

    #item(role,     [
        #if employer.len() > 0 [
            #employer #sym.dot.op  #start - #end
        ] else [
            #start - #end
        ] \
    ], description, oneline: oneline)
]

#let languages(languages) = [
    === Languages

    #for language in languages [
        #item(language.name, [#language.proficiency], [], oneline: true)
    ]
]

// Styling

#set text(font: ("Lato"), size: 9pt)

#show heading.where(level: 2): it => {
    set block(below: 0.5em, above: 1.0em)
    it
    line(length: 100%, stroke: 0.3pt)
    v(0.5em)
}

// Content

#let title = [
    #show heading: set block(below: 0.8em)
    #show heading: set text(weight: 900, size: 1.5em, spacing: 0.2em)
    #set align(center)

    = #upper[T o m #h(1em) L a u w a e r t s]
]

// Page

#let sidemargin = 6em

#let columns = (4fr, 8fr)

#set page(margin: (left: sidemargin, right: sidemargin, top: 4em, bottom: 4em), paper: "a4")

#title


#v(1.5em)
#line(length: 100%, stroke: 0.3pt)

#grid(columns: columns, [
//    === Background & Education
//
//        #item("PhD. Computer Science (candidate)", "2021 - present", [Ghent University, TOPL lab], oneline: true)
//
//    #item("MSc. Computer Science", "2019 - 2021", [Ghent University, faculty of Sciences], oneline: true)
//
//    #item("BSc. Computer Science", "2016 - 2019", [Ghent University, faculty of Sciences], oneline: true)
//
    === Contact

    #[
        #set text(size: 7pt)
        #grid(columns: 1, gutter: 5pt,
        link("mailto:tom.lauwaerts@gmail.com", "tom.lauwaerts@gmail.com"),
        "(+32) 468 20 27 42",
        grid(columns: 4, gutter: 1pt, align: alignment.horizon,
        linkedin("tolauwae"),
        homepage("https://tolauwae.github.io/"),
        github("tolauwae")
        ))
    ]
    //#grid(columns: 1, gutter: 3pt,
    //github("tolauwae")
    //,linkedin("tolauwae")
    //,orcid("0000-0003-1262-8893", full: true)
    //,mail("tom.lauwaerts@gmail.com")
    //,phone("+32 468 20 27 42"))

], [
    Computer science researcher with nearly 4 years experience in programming language research focussed on debugging and testing of embedded applications, and a strong interest in software development and best practices.

])

#v(1.5em)
#line(length: 100%, stroke: 0.3pt)


#grid(columns: columns, [
    === Experience
], [
    #experience("Ghent University", "PhD Researcher: Programming Languages", 2021, "present", "Research into debugging and testing tools with a strong formal foundation.")

    #experience("Ghent University",  "Teaching Assistant", 2021, "present",
        [
        Assisting the lecturer, supervising the tutorials, and responsible for the projects, for the following courses:

        - Fundamenten van programmeertalen
        - Logisch programmeren
    ])

    //#experience("Creative Therapy (startup)", "Embedded Software Developer (Internship)", "July", "August 2020", "Researching WebUSB technology and developing a USB gadget driver in Linux for WebUSB communication between the online platform and the hardware.")

    //#experience("Digipolis", "Software Developer", 2017, 2018, [Student job over two summers: 
    //    - Designing and developing chatbots using Linked Open Data for the #text(style: "italic", "Gentse Feesten"), for the city council of Ghent, and for tourism Ghent.
    //    - Assessing the viability of decentralized blockchain technology for parking in Ghent using a digital "parking coin".
    //])
])

#v(1.5em)
#line(length: 100%, stroke: 0.3pt)

#grid(columns: columns, [
    === Education // Opleiding
], [
        #item("PhD. Computer Science (candidate)", "2021 - present", [Ghent University, TOPL lab], oneline: true)

    #item("MSc. Computer Science", "2019 - 2021", [Ghent University, faculty of Sciences], oneline: true)

    #item("BSc. Computer Science", "2016 - 2019", [Ghent University, faculty of Sciences], oneline: true)
])

#v(1.5em)
#line(length: 100%, stroke: 0.3pt)

#grid(columns: columns, [
    === Languages
        
], [
    #grid(columns: 3, column-gutter: 1em,
    item("Dutch", "Native", [], oneline: true),
    item("English", "High professional proficiency", [], oneline: true),
    item("French", "Elementary", [], oneline: true))
])

#v(1.5em)
#line(length: 100%, stroke: 0.3pt)

#grid(columns: columns, [
    === Highlighted research output
    
    #grid(columns: 3, orcid("0000-0003-1262-8893"), researchgate("Tom-Lauwaerts"), googlescholar("https://scholar.google.com/citations?user=uHdt08sAAAAJ&hl=en&oi=ao"))

], [
    // todo add links

    #item("Latch: Enabling large-scale automated testing on constrained systems", "2024-12 | Science of Computer Programming Journal", [], url: "https://doi.org/10.1016/j.scico.2024.103157", artifact: "https://github.com/TOPLLab/latch")

    #item("WARDuino: An embedded WebAssembly virtual machine", "2024-06 | Journal of Computer Languages", [], url: "https://doi.org/10.1016/j.cola.2024.101268", artifact: "https://github.com/TOPLLab/WARDuino/", docs: "https://topllab.github.io/WARDuino/")

    #item("Event-Based Out-of-Place Debugging", "2022-09-14 | Conference paper (MPLR'22)", [], url: "https://doi.org/10.1145/3546918.3546920", docs: "https://topllab.github.io/WARDuino/reference/edward/")
])

#v(1.5em)
#line(length: 100%, stroke: 0.3pt)

#grid(columns: columns, [
    === International collaborations & \ other research activities
], [
    #item("DEBT workshop co-organizer", "2025", "Co-organizing the DEBT'25 workshop with Burcu Kulahcioglu Ozkan (TU Delft).", oneline: true)

    #item("Programming artifact evaluation committee member", "2024 - 2025", "AEC member for the Programming journal and conference (volumes 9 and 10).", oneline: true)

    #item( "Active collaboration: Open Bot Brain", "2023 - present", "Research project with Francisco Ferreira Ruiz (Royal Holloway).", oneline: true)

    #item( "Research stay: Kent University", "Sept 2022", "Research collaboration with Stefan Marr (Kent University).", oneline: true)

])


#v(1.5em)
#line(length: 100%, stroke: 0.3pt)

#grid(columns: columns, [
    === Honors
], [
    #item( "ISSTA'23 Research competition: 3rd place", "2023", "International ACM Research competition at ECOOP/ISSTA 2023 3rd place medal.", oneline: true)
])



#pagebreak()
#set page(fill: none)

    == Research activities #orcid("0-000-000-000-000") #researchgate("Tom-Lauwaerts") #googlescholar("https://scholar.google.com/citations?user=uHdt08sAAAAJ&hl=en&oi=ao") // TODO

// todo full list: conference talks + colaborations + summer school

    //#item("OPLSS Summer school", "July 2021", "", oneline: true)
//
    === Peer-reviewed work


    #item("Latch: Enabling large-scale automated testing on constrained systems", "2024-12 | Science of Computer Programming Journal", [], url: "doi.org")

    #item("WARDuino: An embedded WebAssembly virtual machine", "2024-06 | Journal of Computer Languages", [])

    #item("Event-Based Out-of-Place Debugging", "2022-09-14 | Conference paper (MPLR)", [])

    === Active research

    === Presentations and short papers

    #item("Concolic Multiverse Debugging", "2024-09 | Demo paper (DEBT'24)", [])

    #item("Out-of-Place Multiverse Debugging", "2023-07 | Demo paper (DEBT'23)", []) // todo check dates

    === Bredere onderzoeksactiviteiten

    - Co-organizer of the DEBT'25 workshop

    - Member of the Artifact Evaluation Committee for the Programming Journal Volume 10

    - Member of the Artifact Evaluation Committee for the Programming Journal Volume 9

    - Research communication at UGent Alumnidag 2023

