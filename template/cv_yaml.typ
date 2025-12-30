// YAML-based CV Template
// This template reads CV entries from cv.yaml instead of individual module files
// To use: typst c cv_yaml.typ

#let metadata = toml("./metadata.toml")
#import metadata.package.config.import_path: cv

#let importYamlModules(modules) = {
  for module in modules {
    include {
      "modules_yaml/" + module + ".typ"
    }
  }
}

#show: cv.with(
  metadata,
  profilePhoto: image("./src/avatar.png"),
)

#importYamlModules((
  "education",
  "professional",
  "projects",
  // "certificates",
  "publications",
  "skills",
))
