// Imports
#let metadata = toml("../metadata.toml")
// #import "@preview/brilliant-cv:2.0.4": cvSection, cvPublication
#import metadata.package.config.import_path: cvSection, cvPublication
#let cvSection = cvSection.with(metadata: metadata)


#cvSection("Publications")

#cvPublication(
  bib: bibliography("../src/publications.bib"),
  keyList: (
    "smith2020",
    "jones2021",
    "wilson2022",
  ),
  refStyle: "apa",
)
