/*
* Utility functions for rendering CV from YAML data
* Converts YAML data structures into CV components
*/

#import "../utils/styles.typ": hBar

/// Render education section from YAML data
///
/// - cvSection (function): The cvSection function from brilliant-cv
/// - cvEntry (function): The cvEntry function from brilliant-cv  
/// - data (array): Array of education entries from YAML
/// - sectionTitle (string): Title of the section (localized)
/// -> content
#let renderEducation(cvSection, cvEntry, data, sectionTitle: "Education") = {
  if data == none or data.len() == 0 {
    return
  }
  
  cvSection(sectionTitle)
  
  for entry in data {
    let args = (:)
    
    if "title" in entry { args.insert("title", [#entry.title]) }
    if "society" in entry { args.insert("society", [#entry.society]) }
    if "date" in entry { args.insert("date", [#entry.date]) }
    if "location" in entry { args.insert("location", [#entry.location]) }
    if "logo" in entry { args.insert("logo", image(entry.logo)) }
    
    if "description" in entry and entry.description != none {
      let items = ()
      for item in entry.description {
        // Replace | with hBar()
        let formatted = item.replace("|", "#hBar()")
        items.push(eval("[" + formatted + "]"))
      }
      args.insert("description", list(..items))
    }
    
    cvEntry(..args)
  }
}

/// Render professional experience section from YAML data
///
/// - cvSection (function): The cvSection function from brilliant-cv
/// - cvEntry (function): The cvEntry function from brilliant-cv
/// - data (array): Array of professional entries from YAML
/// - sectionTitle (string): Title of the section (localized)
/// -> content
#let renderProfessional(cvSection, cvEntry, data, sectionTitle: "Professional Experience") = {
  if data == none or data.len() == 0 {
    return
  }
  
  cvSection(sectionTitle)
  
  for entry in data {
    let args = (:)
    
    if "title" in entry { args.insert("title", [#entry.title]) }
    if "society" in entry { args.insert("society", [#entry.society]) }
    if "date" in entry { args.insert("date", [#entry.date]) }
    if "location" in entry { args.insert("location", [#entry.location]) }
    if "logo" in entry { args.insert("logo", image(entry.logo)) }
    
    if "description" in entry and entry.description != none {
      let items = ()
      for item in entry.description {
        // Replace | with hBar()
        let formatted = item.replace("|", "#hBar()")
        items.push(eval("[" + formatted + "]"))
      }
      args.insert("description", list(..items))
    }
    
    if "tags" in entry and entry.tags != none {
      args.insert("tags", entry.tags)
    }
    
    cvEntry(..args)
  }
}

/// Render projects section from YAML data
///
/// - cvSection (function): The cvSection function from brilliant-cv
/// - cvEntry (function): The cvEntry function from brilliant-cv
/// - data (array): Array of project entries from YAML
/// - sectionTitle (string): Title of the section (localized)
/// -> content
#let renderProjects(cvSection, cvEntry, data, sectionTitle: "Projects & Associations") = {
  if data == none or data.len() == 0 {
    return
  }
  
  cvSection(sectionTitle)
  
  for entry in data {
    let args = (:)
    
    if "title" in entry { args.insert("title", [#entry.title]) }
    if "society" in entry { args.insert("society", [#entry.society]) }
    if "date" in entry { args.insert("date", [#entry.date]) }
    if "location" in entry { args.insert("location", [#entry.location]) }
    if "logo" in entry { args.insert("logo", image(entry.logo)) }
    
    if "description" in entry and entry.description != none {
      let items = ()
      for item in entry.description {
        // Replace | with hBar()
        let formatted = item.replace("|", "#hBar()")
        items.push(eval("[" + formatted + "]"))
      }
      args.insert("description", list(..items))
    }
    
    cvEntry(..args)
  }
}

/// Render skills section from YAML data
///
/// - cvSection (function): The cvSection function from brilliant-cv
/// - cvSkill (function): The cvSkill function from brilliant-cv
/// - data (array): Array of skill entries from YAML
/// - sectionTitle (string): Title of the section (localized)
/// -> content
#let renderSkills(cvSection, cvSkill, data, sectionTitle: "Skills") = {
  if data == none or data.len() == 0 {
    return
  }
  
  cvSection(sectionTitle)
  
  for entry in data {
    let args = (:)
    
    if "type" in entry { args.insert("type", [#entry.type]) }
    if "info" in entry {
      // Replace | with hBar()
      let formatted = entry.info.replace("|", "#hBar()")
      args.insert("info", eval("[" + formatted + "]"))
    }
    
    cvSkill(..args)
  }
}

/// Render publications section from YAML data
///
/// - cvSection (function): The cvSection function from brilliant-cv
/// - cvPublication (function): The cvPublication function from brilliant-cv
/// - data (dictionary): Publications data from YAML
/// - sectionTitle (string): Title of the section (localized)
/// -> content
#let renderPublications(cvSection, cvPublication, data, sectionTitle: "Publications") = {
  if data == none {
    return
  }
  
  cvSection(sectionTitle)
  
  let args = (:)
  
  if "bib" in data { args.insert("bib", bibliography(data.bib)) }
  if "keyList" in data { args.insert("keyList", data.keyList) }
  if "refStyle" in data { args.insert("refStyle", data.refStyle) }
  
  cvPublication(..args)
}

/// Render certificates section from YAML data
///
/// - cvSection (function): The cvSection function from brilliant-cv
/// - cvEntry (function): The cvEntry function from brilliant-cv
/// - data (array): Array of certificate entries from YAML
/// - sectionTitle (string): Title of the section (localized)
/// -> content
#let renderCertificates(cvSection, cvEntry, data, sectionTitle: "Certificates") = {
  if data == none or data.len() == 0 {
    return
  }
  
  cvSection(sectionTitle)
  
  for entry in data {
    let args = (:)
    
    if "title" in entry { args.insert("title", [#entry.title]) }
    if "issuer" in entry { args.insert("society", [#entry.issuer]) }
    if "date" in entry { args.insert("date", [#entry.date]) }
    if "url" in entry { args.insert("location", link(entry.url, entry.url)) }
    
    cvEntry(..args)
  }
}
