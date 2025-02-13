// Imports
#let metadata = toml("./metadata.toml")
// #import "@preview/brilliant-cv:2.0.4": cv
#import metadata.package.config.import_path: cv
#let importModules(modules, lang: metadata.language) = {
  for module in modules {
    include {
      "modules_" + lang + "/" + module + ".typ"
    }
  }
}


#show: cv.with(
  metadata,
  profilePhoto: image("./src/avatar.png"),
)
#importModules((
  "education",
  "professional",
  "projects",
  // "certificates",
  "publications",
  "skills",
))
