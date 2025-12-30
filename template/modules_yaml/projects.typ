// YAML-based Projects Module
// Loads project entries from cv.yaml

#let metadata = toml("../metadata.toml")
#import metadata.package.config.import_path: cvSection, cvEntry
#import metadata.package.config.import_path: *
#import "/utils/yaml_loader.typ": loadEntries

#let cvSection = cvSection.with(metadata: metadata)
#let cvEntry = cvEntry.with(metadata: metadata)

// Load CV data from YAML
#let cvData = yaml("../cv.yaml")

#cvSection("Projects & Associations")

#loadEntries(cvData.at("projects", default: ()), cvEntry, metadata)
