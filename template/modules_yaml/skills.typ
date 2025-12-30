// YAML-based Skills Module
// Loads skill entries from cv.yaml

#let metadata = toml("../metadata.toml")
#import metadata.package.config.import_path: cvSection, cvSkill
#import metadata.package.config.import_path: *
#import "/utils/yaml_loader.typ": loadSkills

#let cvSection = cvSection.with(metadata: metadata)

// Load CV data from YAML
#let cvData = yaml("../cv.yaml")

#cvSection("Skills")

#loadSkills(cvData.at("skills", default: ()), cvSkill)
