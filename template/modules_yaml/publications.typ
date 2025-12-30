// YAML-based Publications Module
// Loads publication configuration from cv.yaml

#let metadata = toml("../metadata.toml")
#import metadata.package.config.import_path: cvSection, cvPublication
#import metadata.package.config.import_path: *

#let cvSection = cvSection.with(metadata: metadata)

// Load CV data from YAML
#let cvData = yaml("../cv.yaml")

#cvSection("Publications")

// Get publications config from YAML
#let pubConfig = cvData.at("publications", default: none)

#if pubConfig != none {
  cvPublication(
    bib: bibliography(pubConfig.at("bib_path", default: "../src/publications.bib")),
    keyList: pubConfig.at("keys", default: ()),
    refStyle: pubConfig.at("style", default: "apa"),
    refFull: pubConfig.at("full", default: true),
  )
}
