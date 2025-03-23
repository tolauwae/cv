// Colour scheme

#let highlight = rgb(32, 159, 181)
#let subdued = rgb(92, 95, 119)

// Socials

#let social(url, icon, body) = [
    #show link: set text(weight: 500)
    #link(url, body)
]

#let linkedin(id, color: rgb(0,0,0)) = { 
    social("https://linkedin.com/" + id, "", id)
}

#let github(id, color: rgb(0,0,0)) = {
    social("https://github.com/" + id, "", id)
}

#let mail(id, color: rgb(0,0,0)) = {
    social("mailto:" + id, "", id)
}

#let phone(number, color: rgb(0, 0, 0)) = [
    #number
]

#let researchgate(id, color: rgb(0,0,0)) = {
    social("https://researchgate.com/" + id, "", $R^G$)
}

#let googlescholar(id, color: rgb(0,0,0)) = {
    social("https://scholar.google.com/" + id, "", "scholar")
}

#let orcid(id, color: rgb(0,0,0)) = {
    social("https://orcid.org/" + id, "", "orcid")
}

// Building blocks

#let item(head, quiet, description, oneline: false, url: none, artifact: none) = [
    #let emphasize(addendum: [], body) = [
        #block(above: 1.2em, below: 0.7em)[
            #if oneline [#text(size: 12pt, weight: 700)[#body] #text(fill: subdued, style: "italic")[#sym.dot.op #addendum]
            ] else [#text(size: 12pt, weight: 700)[#body]]
            #if url != none [
                #link(url)[ (pdf)]  // todo add pdf logo
            ]
            #if artifact != none [
                #link(artifact)[ (git)]  // todo add pdf logo
            ]
        ]
    ]

    #show heading: set block(below: 0.7em)
    #show heading: set text(size: 7pt)
    #set text(11pt)

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
    #show heading: set text(size: 12pt)
    #set text(11pt)

    #item(role,     [
        #if employer.len() > 0 [
            #employer #sym.dot.op  #start - #end
        ] else [
            #start - #end
        ] \
    ], description, oneline: oneline)
]

#let languages(languages) = [
    == Languages

    #for language in languages [
        #item(language.name, [#language.proficiency], [], oneline: true)
    ]
]

// Styling

#set text(font: ("Lato"))

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

#let leftside = [
    == Contact

    #github("tolauwae")
    
    #linkedin("tolauwae")

    #mail("tom.lauwaerts@gmail.com")

    #phone("+32 468 20 27 42")

    == Education // Opleiding

    #item("PhD. Computer Science", "2021 - present", [Ghent University, TOPL lab])

    #item("MSc. Computer Science", "2019 - 2021", [Ghent University, faculty of Sciences])

    #item("BSc. Computer Science", "2016 - 2019", [Ghent University, faculty of Sciences])

    #languages(((name: "Dutch", proficiency: "Native"),
        (name: "English", proficiency: "Highly proficient"),
        (name: "French", proficiency: "Elementary")))

    == Honors and Certifications // Onderscheidingen

    #item("ISSTA'23 SRC: 3rd place", "Issued by ACM SIGSOFT", [The International ACM Student Research Competition at ISSTA/ECOOP 2023.])
]

#let righthead = [
    // #rect(width: 100%, height: 100%, fill: rgb("f0f0f0"))
    // professional profile
]

#let rightside = [
    == Experience

    #experience("Ghent University", "Researcher: Programming Languages", 2021, "present", "Research into debugging and testing tools with a strong formal foundation.")

    #experience("Ghent University",  "Teaching Assistant", 2021, "present",
        [
    - #experience("", "Fundamenten van programmeertalen", 2021, "present", "Assisting the lecturer, and supervising the tutorials.", oneline: true)

    - #experience("", "Logisch programmeren", 2023, "present", "Assisting the lecturer, supervising tutorials, and responsible for the project.", oneline: true)

    ])

    #experience("Creative Therapy (startup)", "Embedded Software Developer (Internship)", "July", "August 2020", "Researching WebUSB technology and developing a USB gadget driver in Linux for WebUSB communication between the online platform and the hardware.")

    #experience("Digipolis", "Software Developer", 2017, 2018, [Student job over two summers: 
        - Designing and developing chatbots using Linked Open Data for the #text(style: "italic", "Gentse Feesten"), for the city council of Ghent, and for tourism Ghent.
        - Assessing the viability of decentralized blockchain technology for parking in Ghent using a digital "parking coin".
    ])  // todo add links
]


// Page

#let sidemargin = 6em

#set page(margin: (left: sidemargin, right: sidemargin, top: 4em, bottom: 4em), paper: "a4")

#title

#v(1.5em)
#line(length: 100%, stroke: 0.3pt)

#grid(columns: (4fr, 6fr), [
    === Contact

    #github("tolauwae") #linkedin("tolauwae") #orcid("0-000")

    #mail("tom.lauwaerts@gmail.com")

    #phone("+32 468 20 27 42")

], [
    Computer science researcher with 3+ years experience in programming language research focussed on debugging and testing of embedded applications, with a strong interest in software development and best practices.

])

#v(1.5em)
#line(length: 100%, stroke: 0.3pt)


#grid(columns: (4fr, 6fr), [
    === Main research output
    
    #orcid("0-000-000-000-000") #researchgate("tolauwae") #googlescholar("tom.lauwaerts") // TODO

], [
    // todo add links

    #item("Latch: Enabling large-scale automated testing on constrained systems", "2024-12 | Science of Computer Programming Journal", [], url: "doi.org", artifact: "github.com")

    #item("WARDuino: An embedded WebAssembly virtual machine", "2024-06 | Journal of Computer Languages", [])

    #item("Event-Based Out-of-Place Debugging", "2022-09-14 | Conference paper (MPLR'22)", [])
])

#v(1.5em)
#line(length: 100%, stroke: 0.3pt)


#grid(columns: (4fr, 6fr), [
    === Experience
], [
    #experience("Ghent University", "Researcher: Programming Languages", 2021, "present", "Research into debugging and testing tools with a strong formal foundation.")

    #experience("Ghent University",  "Teaching Assistant", 2021, "present",
        [
    - #item( "Fundamenten van programmeertalen", "", "Assisting the lecturer, and supervising the tutorials.", oneline: true)

    - #item("Logisch programmeren", "", "Assisting the lecturer, supervising tutorials, and responsible for the project.", oneline: true)

    ])

    //#experience("Creative Therapy (startup)", "Embedded Software Developer (Internship)", "July", "August 2020", "Researching WebUSB technology and developing a USB gadget driver in Linux for WebUSB communication between the online platform and the hardware.")

    //#experience("Digipolis", "Software Developer", 2017, 2018, [Student job over two summers: 
    //    - Designing and developing chatbots using Linked Open Data for the #text(style: "italic", "Gentse Feesten"), for the city council of Ghent, and for tourism Ghent.
    //    - Assessing the viability of decentralized blockchain technology for parking in Ghent using a digital "parking coin".
    //])
])

#v(1.5em)
#line(length: 100%, stroke: 0.3pt)

#grid(columns: (4fr, 6fr), [
    === International collaborations
], [
    #item( "Active collaboration: Open Bot Brain", "2023 - present", "Research project with the Royal Galloway University.", oneline: true) // todo check name of uni

    #item( "Researchs stay: Kent University", "Sept 2022", "Research stay at Stefan Marr lab in UKent.", oneline: true)

])

#v(1.5em)
#line(length: 100%, stroke: 0.3pt)

#grid(columns: (4fr, 6fr), [
    === Honors
], [
    #item( "ISSTA'23 Research competition: 3rd place", "2023", "International ACM Research competition at ECOOP/ISSTA 2023 3rd place medal.", oneline: true)
])



#pagebreak()
#set page(fill: none)

    == Research activities #orcid("0-000-000-000-000") #researchgate("tolauwae") #googlescholar("tom.lauwaerts") // TODO

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

