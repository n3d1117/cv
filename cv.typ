/* TEMPLATE */
#set text(10.9pt, lang: "en")
#set page(margin: (x: 1.5cm, y: 1.6cm))
#show link: underline
#show heading.where(level: 2): it => text(15pt,
  [
    #{it.body}
    #v(-13pt)
    #line(length: 100%, stroke: 0.7pt)
  ]
)

#let icon(name, baseline: 2.5pt, height: 10pt, hspace: 3pt) = {
  box(
    baseline: baseline,
    height: height,
    image("img/" + name + ".svg")
  )
  h(hspace)
}

#let links(services) = {
  set text(8pt, font: "SF Mono")
  services.map(service => {
    icon(service.name)
    if "display" in service.keys() {
      link(service.link)[#{service.display}]
    } else {
      link(service.link)
    }
  }).join(h(15pt))
}

#let entry(name, where, city, date) = {
  text(12pt, weight: "semibold")[#name]
  h(4pt)
  text(style: "italic")[#where]
  h(3pt)
  text(style: "italic", fill: rgb("808080"))[-- #city]
  h(1fr)
  text[#date]
  v(1pt)
}

#let projects(projects) = {
  set par(leading: 0.5em)
  v(3pt)
  for (index, project) in projects.enumerate() [
    - #block([
        #text(weight: "semibold")[#link(project.link)[#project.name]]
        #h(1pt)
        #icon("github", baseline: 1.8pt, hspace: 3pt, height: 9pt)
        #project.description
        #if index != projects.len() - 1 [ #v(3pt) ]
      ])
  ]
}

#let pills(skills) = {
  let cell = rect.with(radius: 5pt, inset: (top: 5pt, bottom: 5pt, left: 6pt, right: 6pt), fill: rgb("F0F0F0"), stroke: 0.4pt + rgb("808080"))
  let boxes = for skill in skills {(box(cell(text(9pt)[#skill])),)}
  v(-3pt)
  {boxes.join("  ")}
}

#let name(name) = {
  block(text(25pt, font: "Tiempos headline")[#name])
}

#let tagline(tagline) = {
  block(text(11pt, font: "SF Mono", fill: rgb("808080"))[#tagline])
  v(-1pt)
}

/* CONTENT */
#name("Edoardo D'Angelis")
#tagline("/* Software Engineer passionate about iOS, Swift and SwiftUI */")
#links((
  (name: "email", link: "mailto:contact@edoardo.fyi"),
  (name: "website", link: "https://edoardo.fyi/", display: "edoardo.fyi"),
  (name: "github", link: "https://github.com/n3d1117", display: "n3d1117"),
  (name: "linkedin", link: "https://linkedin.com/in/edoardodangelis", display: "edoardodangelis")
))

#v(5pt)

== Work Experience
#entry[Software Engineer][Magenta Srl][Florence, Italy][Feb 2022 --- present]
- Building the #link("https://www.greenapes.com/en/")[greenApes] iOS app, a social network focused on sustainability and positive environment impact, using Swift, SwiftUI and Combine. Lead a major rewrite from an old Objective-C codebase and successfully shipped 30+ updates on the App Store
- Working as a consultant at #link("https://www.thalesgroup.com/en")[Thales Italia], developing a suite of applications designed to monitor airport systems and enhance the efficiency of boarding processes, using Java (Quarkus), Apache Kafka and Angular (NgRx)

#entry[Software Engineer Intern][Magenta Srl][Florence, Italy][Sep 2021 --- Jan 2022]
- Applied robust regression models based on historical data to enhance the calibration process of the #link("https://www.airqino.it/en/")[AirQino] air quality stations, resulting in a 15% increase in accuracy for PM#sub[2.5] and PM#sub[10] sensors
- Optimized SQL queries and applied #link("https://www.timescale.com")[Timescale]'s _continuous aggregates_ technique to the #link("https://www.airqino.it/en/")[AirQino] backend APIs, resulting in a response time improvement of over 10x for specific queries
- Set up a 1:1 read-only streaming replica of the primary #link("https://www.airqino.it/en/")[AirQino] PostgreSQL database (>100#smallcaps([m]) rows) for performance tests, relieving the load on the primary database and increasing availability

== Education
#entry[MSc in Computer Science & Engineering][University of Florence][Florence, Italy][Sep 2019 --- Apr 2022]
- #underline[Final grade]: 110/110 with honours
// - #underline[Thesis]: Design and development of components for the #link("https://www.airqino.it/en/")[AirQino] platform dedicated to air quality monitoring

#entry[BSc in Computer Science & Engineering][University of Florence][Florence, Italy][Sep 2015 --- Apr 2019]
// - #underline[Thesis]: Semantic expansion of bibliographic records: using ML-based entity extraction tools (such as #link("https://spacy.io")[spaCy]) and #link("https://www.w3.org/TR/rdf-sparql-query/")[SPARQL] queries to generate annotations based on geographic data

== Personal Projects
#projects((
  (
    name: "chatgpt-telegram-bot", 
    link: "https://github.com/n3d1117/chatgpt-telegram-bot", 
    description: [A Telegram bot that uses OpenAI's ChatGPT, DALL·E and Whisper APIs to answer questions, generate images from text and transcribe audio files. Written in Python --- 1.8#smallcaps([k])+ stars on GitHub]
  ),
  (
    name: "appdb", 
    link: "https://github.com/n3d1117/appdb", 
    description: [A fully-featured iOS client for _appdb_, a third party app store for iOS devices. Written in Swift with UIKit --- 250+ stars on GitHub]
  ),
  (
    name: "stats-ios", 
    link: "https://github.com/n3d1117/stats-ios", 
    description: [A personal iOS app to keep track of movies and tv shows I've watched, books I've read, games I've played and music I've listened to. Written in SwiftUI]
  ),
  (
    name: "cook", 
    link: "https://github.com/n3d1117/cook", 
    description: [A macOS command line tool to automate common iOS development tasks, such as managing iOS certificates, provisioning profiles and resigning `.ipa` files. Written in Swift]
  ),
  (
    name: "dl-buddy", 
    link: "https://github.com/n3d1117/dl-buddy", 
    description: [A download manager for macOS with configurable destination, persistence and resumable downloads. Written in Swift with AppKit]
  )
))

#v(4pt)
#grid(
  columns: (0.6fr, 0.4fr),
  gutter: 18pt,
  [
  == Skills
  - *Programming Languages:*
    Swift, Python, Java, TypeScript
  - *Libraries & Frameworks* 
    - SwiftUI, UIKit, Combine, AppKit and other Apple frameworks
    - Vapor, Quarkus, Apache Kafka, Angular, Flask, Karate
  - *Tools & Platforms*
    - Git, GitHub, GitLab, Xcode, Fastlane, Crashlytics, Firebase
    - Jira, Docker, Kubernetes, RedPanda, AWS
  - *Other:* Experience with iOS reverse engineering and jailbreak tweaks development, CI/CD, unit and integration testing, relational databases, agile methodologies
  ],
  [
  == Conferences attended
  #pills((
    link("https://pragmaconference.com/")[\#Pragma (2023)],
    link("https://2019.pragmaconference.com")[\#Pragma (2019)]
  ))

  == Languages
  #pills((
    "Italian (native)",
    "English (advanced)"
  ))

  == Interests
  #pills((
    "Open Source Software",
    "Automation",
    "Reverse Engineering",
    "Football"
  ))
  ]
)