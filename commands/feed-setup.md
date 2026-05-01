# /feed-setup — Job Feed Calibration

Builds `context/sources.md` by reading the user's resume first, drafting a spec from it, then filling in the gaps through targeted questions.

---

## When to use

Run once before using `/feed` for the first time. Takes 10-15 minutes. The result is a complete `sources.md` that the feed agent uses to find and score roles.

---

## Protocol

### Step 1 — Read the resume

Read `context/resume.md`. If it doesn't exist, stop and say:

> "I need your resume before I can set up the feed. Go back to setup step 1 — paste your resume into Claude Code and ask me to save it to `context/resume.md`."

### Step 2 — Draft the spec

From the resume, infer:

- **Titles**: what roles they've held and what logical next titles would be
- **Seniority**: current level and whether they're looking to stay level, step up, or are open to both
- **Domains**: industries and product areas they have experience in
- **Location**: where they're based (if listed)
- **Work authorisation**: whether they require sponsorship (if listed)

Draft a `sources.md` using these inferences. Annotate each inferred section with a brief note explaining the reasoning, e.g. *"Inferred from 8 years in fintech PM roles."* Leave gaps clearly marked as `[not found in resume — see below]`.

Show the draft to the user. Say:

> "Here's what I pulled from your resume. Read through it and tell me if anything's wrong before we fill in the rest."

Wait for confirmation or corrections. Apply any changes.

### Step 3 — Ask the remaining questions

Ask these one at a time, in order. Wait for each answer before moving to the next. Do not bundle questions.

**Location & commute**
1. What's your location preference — remote, hybrid, or on-site?
2. *(If hybrid or on-site)* What's your maximum commute — distance or time?
3. Are you open to relocating?

**Employment type**
4. Are you looking for full-time roles only, or are you open to contract or fractional work?

**Work authorisation**
5. *(Skip if already confirmed from resume)* Do you require visa sponsorship?

**Compensation**
6. What's your floor — the minimum base you'd accept?
7. What's your target — the base you're genuinely aiming for?
8. What's your reach — what you'd be thrilled with?
9. Any comp structure preferences — base-heavy vs. equity-heavy, cash bonus, RSUs?
10. Any benefits that are must-haves or deal-breakers? (e.g. PTO, parental leave, health coverage, 401k match, visa sponsorship)

**Companies & filters**
11. Any specific companies you want to watch directly?
12. Any stage or size preferences — early stage, growth, public, enterprise?
13. What are your deal-breakers — role types, domains, or company types to exclude entirely?

**Timeline**
14. Are you actively looking now, or passively exploring?

**Feed settings**
15. How many results do you want per run — 10, 25, 50?
16. How fresh — roles posted in the last 24, 48, or 72 hours?

**Scoring documents**
17. Do you have a Mnookin doc? If yes, paste it or give the file path — it'll be used for scoring and will supplement or override what you've entered above.
18. Do you have a CMF (Company/Market Fit doc)? Same — paste or path, or skip.

### Step 4 — Write sources.md

Incorporate all answers into `context/sources.md`. Structure:

```
## Role Targets
[inferred + confirmed titles and seniority]

## Location & Commute
[preference, commute limit, relocation]

## Employment Type
[full-time / contract / fractional]

## Work Authorisation
[requires sponsorship: yes/no]

## Compensation
Floor: [base]
Target: [base]
Reach: [base]
Structure preferences: [notes]
Benefits must-haves: [list]

## Target Companies
[table: company, why, ATS URL]

## Company Preferences
[stage, size, culture signals]

## What to Avoid
[deal-breakers]

## Timeline
[active / passive]

## Feed Settings
results_wanted: [n]
hours_old: [n]

## Scoring Documents
[paths or inline content for Mnookin / CMF if provided]
```

### Step 5 — Confirm

Say:

> "Feed configured. Run `python3 feed-agent/fetch.py` to fetch today's roles, then open Claude Code and run `/feed` to score them."

If the user provided a Mnookin or CMF doc, add:

> "I've incorporated your [Mnookin / CMF] into the scoring criteria — it'll be used to weight roles from the next feed run."
