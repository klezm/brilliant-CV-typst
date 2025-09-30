// CV template that generates content from YAML data file
// This demonstrates automatic CV generation while maintaining backward compatibility

// Imports
#let metadata = toml("./metadata.toml")
#import metadata.package.config.import_path: cv, cvSection, cvEntry, cvSkill, cvPublication, hBar
#let cvSection = cvSection.with(metadata: metadata)
#let cvEntry = cvEntry.with(metadata: metadata)

// Import YAML rendering utilities
#import "../utils/yaml-cv.typ": renderEducation, renderProfessional, renderProjects, renderSkills, renderPublications, renderCertificates

// Determine which YAML file to load based on language
#let lang = metadata.language
#let yamlFile = if lang == "fr" {
  "./data/cv-fr.yaml"
} else if lang == "zh" {
  "./data/cv-zh.yaml"
} else {
  "./data/cv.yaml"  // Default to English
}

// Load CV data from YAML
#let cvData = yaml(yamlFile)

// Get localized section titles based on language
#let sectionTitles = if lang == "en" {
  (
    education: "Education",
    professional: "Professional Experience",
    projects: "Projects & Associations",
    skills: "Skills",
    publications: "Publications",
    certificates: "Certificates",
  )
} else if lang == "fr" {
  (
    education: "Formation",
    professional: "Expérience professionnelle",
    projects: "Projets & Associations",
    skills: "Compétences",
    publications: "Publications",
    certificates: "Certificats",
  )
} else if lang == "zh" {
  (
    education: "教育经历",
    professional: "职业经历",
    projects: "项目与协会",
    skills: "技能",
    publications: "出版物",
    certificates: "证书",
  )
} else {
  // Default to English
  (
    education: "Education",
    professional: "Professional Experience",
    projects: "Projects & Associations",
    skills: "Skills",
    publications: "Publications",
    certificates: "Certificates",
  )
}

// Apply CV layout
#show: cv.with(
  metadata,
  profilePhoto: image("./src/avatar.png"),
)

// Render sections from YAML data
#renderEducation(cvSection, cvEntry, cvData.at("education", default: none), sectionTitle: sectionTitles.education)
#renderProfessional(cvSection, cvEntry, cvData.at("professional", default: none), sectionTitle: sectionTitles.professional)
#renderProjects(cvSection, cvEntry, cvData.at("projects", default: none), sectionTitle: sectionTitles.projects)
#renderPublications(cvSection, cvPublication, cvData.at("publications", default: none), sectionTitle: sectionTitles.publications)
#renderSkills(cvSection, cvSkill, cvData.at("skills", default: none), sectionTitle: sectionTitles.skills)
#renderCertificates(cvSection, cvEntry, cvData.at("certificates", default: none), sectionTitle: sectionTitles.certificates)
