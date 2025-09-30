# CV Data in YAML Format

This directory contains YAML data files for automatically generating CVs.

## Usage

To use YAML-based CV generation:

1. Edit the appropriate YAML file for your language:
   - `cv.yaml` for English
   - `cv-fr.yaml` for French
   - `cv-zh.yaml` for Chinese

2. Set the language in `metadata.toml`:
   ```toml
   language = "en"  # or "fr" or "zh"
   ```

3. Instead of using `cv.typ`, use `cv-from-yaml.typ` as your main document

4. Compile with: `typst compile cv-from-yaml.typ`

The YAML file will be automatically selected based on your language setting in `metadata.toml`.

## YAML Structure

The YAML files support the following sections:

### Education
```yaml
education:
  - title: Degree Name
    society: Institution Name
    date: Start - End
    location: Location
    logo: ./src/logos/institution.png  # Optional
    description:
      - Description line 1
      - Description line 2
```

### Professional Experience
```yaml
professional:
  - title: Job Title
    society: Company Name
    date: Start - End
    location: Location
    logo: ./src/logos/company.png  # Optional
    description:
      - Responsibility 1
      - Responsibility 2
    tags:  # Optional
      - Tag1
      - Tag2
```

### Projects
```yaml
projects:
  - title: Project Title
    society: Organization
    date: Date Range
    location: Location
    description:
      - Achievement 1
      - Achievement 2
```

### Skills
```yaml
skills:
  - type: Skill Category
    info: Skill1 | Skill2 | Skill3
```

Note: Use `|` (pipe) as separator in descriptions and skills info - it will be automatically converted to the proper separator in the CV.

## Backward Compatibility

The traditional module-based approach (using `cv.typ` with manual `modules_*` files) continues to work as before. YAML support is an optional alternative workflow.
