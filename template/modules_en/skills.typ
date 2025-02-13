// Imports
#let metadata = toml("../metadata.toml")
// #import "@preview/brilliant-cv:2.0.4": cvSection, cvSkill, hBar
#import metadata.package.config.import_path: cvSection, cvSkill, hBar
#let cvSection = cvSection.with(metadata: metadata)


#cvSection("Skills")

#cvSkill(
  type: [Languages],
  info: [English #hBar() French #hBar() Chinese],
)

#cvSkill(
  type: [Tech Stack],
  info: [Tableau #hBar() Python (Pandas/Numpy) #hBar() PostgreSQL],
)

#cvSkill(
  type: [Personal Interests],
  info: [Swimming #hBar() Cooking #hBar() Reading],
)
