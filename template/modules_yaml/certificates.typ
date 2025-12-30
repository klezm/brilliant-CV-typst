// YAML-based Certificates Module
// Loads certificate entries from cv.yaml

#let metadata = toml("../metadata.toml")
#import metadata.package.config.import_path: cvSection, cvHonor
#import metadata.package.config.import_path: *
#import "/utils/yaml_loader.typ": loadHonors

#let cvSection = cvSection.with(metadata: metadata)
#let cvHonor = cvHonor.with(metadata: metadata)

// Load CV data from YAML
#let cvData = yaml("../cv.yaml")

#cvSection("Certificates")

#loadHonors(cvData.at("certificates", default: ()), cvHonor, metadata)
