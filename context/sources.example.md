> **Purpose:** Your search criteria for the daily job feed. The agent reads this when running `/feed` to score roles against your targets. Only needed if you're using the feed agent — you can ignore this file if you're sourcing roles manually.

# Job Feed — Search Criteria

## Role Targets

- [Target title 1, e.g. "Senior Product Manager (consumer-facing)"]
- [Target title 2]

## Location

- [City, State (on-site or hybrid)]
- Remote (US-based) — or specify your preference

## Target Companies

Companies worth watching directly — check their careers pages.

| Company | Why | ATS / Careers URL |
|---------|-----|-------------------|
| [Company] | [One-line reason] | [URL] |

## Keywords (for JobSpy / board searches)

```
search_terms:
  - "[keyword 1]"
  - "[keyword 2]"

location: "[City, State or Remote]"
results_wanted: 25
hours_old: 48
```

## What to Avoid

- [Role type, domain, or company type to filter out]
- [e.g. "Pure enterprise sales roles", "Staffing agencies"]
