// YAML-based Education Module
// Loads education entries from cv.yaml

#let metadata = toml("../metadata.toml")
#import metadata.package.config.import_path: cvSection, cvEntry
#import metadata.package.config.import_path: *
#import "/utils/yaml_loader.typ": loadEntries

#let cvSection = cvSection.with(metadata: metadata)
#let cvEntry = cvEntry.with(metadata: metadata)

// Load CV data from YAML
#let cvData = yaml("../cv.yaml")

#cvSection("Education")

#loadEntries(cvData.at("education", default: ()), cvEntry, metadata)
