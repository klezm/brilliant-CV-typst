# YAML-based CV Generation

This document provides examples and guidance for using the YAML-based CV generation feature.

## Quick Start

### Option 1: Use Example Data (Fastest)

1. The template already includes example YAML files in `template/data/`:
   - `cv.yaml` (English)
   - `cv-fr.yaml` (French)
   - `cv-zh.yaml` (Chinese)

2. Set your preferred language in `template/metadata.toml`:
   ```toml
   language = "en"  # or "fr" or "zh"
   ```

3. Compile the YAML-based CV:
   ```bash
   cd template
   typst compile cv-from-yaml.typ
   ```

### Option 2: Create Your Own Data

1. Copy an example file and customize it:
   ```bash
   cd template/data
   cp cv.yaml my-cv.yaml
   # Edit my-cv.yaml with your information
   ```

2. Update `cv-from-yaml.typ` to use your file:
   ```typst
   #let cvData = yaml("./data/my-cv.yaml")
   ```

3. Compile:
   ```bash
   typst compile cv-from-yaml.typ
   ```

## YAML File Structure

### Basic Entry Format

Each CV section (education, professional, projects) follows this structure:

```yaml
section_name:
  - title: Entry Title
    society: Organization Name
    date: Date Range
    location: Location
    logo: ./src/logos/logo.png  # Optional
    description:
      - First point
      - Second point
    tags:  # Optional (professional experience only)
      - Tag1
      - Tag2
```

### Skills Format

Skills use a simpler format:

```yaml
skills:
  - type: Category Name
    info: Item1 | Item2 | Item3
```

**Note:** Use `|` (pipe character) to separate items - it will be automatically converted to proper separators in the CV.

### Publications Format

Publications reference a bibliography file:

```yaml
publications:
  bib: ./src/publications.bib
  keyList:
    - citation_key_1
    - citation_key_2
  refStyle: apa
```

## Switching Between Manual and YAML Approaches

You can maintain both workflows in the same project:

- **Manual approach**: Edit `modules_*/` files → compile `cv.typ`
- **YAML approach**: Edit `data/*.yaml` files → compile `cv-from-yaml.typ`

Both produce identical output and share the same:
- Styling and layout (from `metadata.toml`)
- Logo images (in `src/logos/`)
- Profile photo (in `src/`)

## Language Support

The system automatically selects the correct YAML file based on your `metadata.toml` language setting:

| Language Setting | YAML File Used |
|-----------------|----------------|
| `language = "en"` | `cv.yaml` |
| `language = "fr"` | `cv-fr.yaml` |
| `language = "zh"` | `cv-zh.yaml` |

This means you can maintain separate CV content for each language and switch by changing one line in `metadata.toml`.

## Tips and Best Practices

1. **Images and Logos**: Use relative paths from the template directory (e.g., `./src/logos/company.png`)

2. **Descriptions**: Keep description items concise and use `|` for inline separators:
   ```yaml
   - "Course: Database Systems | Computer Networks | AI"
   ```

3. **Optional Fields**: You can omit `logo`, `location`, or `tags` if not needed

4. **Version Control**: YAML files are text-based, making them ideal for git version control

5. **Data Portability**: YAML format makes it easy to:
   - Export your CV data to other formats
   - Share CV content structure with others
   - Generate CVs programmatically

## Troubleshooting

**Error: file not found**
- Check that paths in your YAML file are relative to the template directory
- Verify that logo images exist in the specified location

**Formatting issues**
- Ensure YAML syntax is correct (proper indentation, no tabs)
- Use quotes around strings containing special characters

**Missing sections**
- Sections with no data (`none` or empty array) are automatically skipped
- This is intentional - add data to the YAML file to make sections appear

## Examples

See the example YAML files for complete, working examples:
- `template/data/cv.yaml` - English example
- `template/data/cv-fr.yaml` - French example
- `template/data/cv-zh.yaml` - Chinese example

## Contributing

If you create YAML support for additional languages, consider contributing them back to the project!
