/*
 * YAML Loader utility for brilliant-CV
 * Provides functions to load CV data from YAML files
 */

/// Load CV entries from YAML data.
/// This function converts YAML entries to cvEntry calls.
///
/// - entries (array): Array of entry dictionaries from YAML.
/// - cvEntry (function): The cvEntry function to use.
/// - metadata (dictionary): The metadata for styling.
/// -> content
#let loadEntries(entries, cvEntry, metadata) = {
  for entry in entries {
    let logo_content = if entry.at("logo", default: "") != "" {
      image(entry.logo)
    } else {
      ""
    }
    
    let description_content = if entry.at("description", default: none) != none {
      let desc = entry.description
      if type(desc) == array {
        list(..desc)
      } else {
        desc
      }
    } else {
      ""
    }
    
    cvEntry(
      title: entry.at("title", default: ""),
      society: entry.at("society", default: ""),
      date: entry.at("date", default: ""),
      location: entry.at("location", default: ""),
      description: description_content,
      logo: logo_content,
      tags: entry.at("tags", default: ()),
      metadata: metadata,
    )
  }
}

/// Load honors/certificates from YAML data.
/// This function converts YAML honor entries to cvHonor calls.
///
/// - honors (array): Array of honor dictionaries from YAML.
/// - cvHonor (function): The cvHonor function to use.
/// - metadata (dictionary): The metadata for styling.
/// -> content
#let loadHonors(honors, cvHonor, metadata) = {
  for honor in honors {
    cvHonor(
      date: honor.at("date", default: ""),
      title: honor.at("title", default: ""),
      issuer: honor.at("issuer", default: ""),
      url: honor.at("url", default: ""),
      location: honor.at("location", default: ""),
      metadata: metadata,
    )
  }
}

/// Load skills from YAML data.
/// This function converts YAML skill entries to cvSkill calls.
///
/// - skills (array): Array of skill dictionaries from YAML.
/// - cvSkill (function): The cvSkill function to use.
/// -> content
#let loadSkills(skills, cvSkill) = {
  for skill in skills {
    cvSkill(
      type: skill.at("type", default: ""),
      info: skill.at("info", default: ""),
    )
  }
}

/// Load all CV sections from a YAML file.
/// Returns the raw YAML data as a dictionary.
///
/// - yamlPath (string): Path to the YAML file.
/// -> dictionary
#let loadYamlCV(yamlPath) = {
  let data = yaml(yamlPath)
  return data
}
