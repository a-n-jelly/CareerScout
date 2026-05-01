# /feed — Daily Job Feed

Scores roles from `feed-agent/today.json` against your targeting criteria and writes a shortlist to `feed/feed.md`. Lightweight — no resume, no storybank. Those belong in `/assess`.

---

## Step 1 — Load context

Read:
- `feed-agent/today.json` — roles to score
- `context/sources.md` — target companies, signals, avoid list, location, comp band, differentiators
- `context/state.md` — pipeline roles already in progress (skip these)
- `feed-agent/learnings.md` — rejected patterns and injected roles

That's it. Do not load resume.md, profile.md, or storybank.md.

---

## Step 2 — Archive previous feed

Archive current `feed/feed.md` to `feed/archive/YYYY-MM-DD.md` using today's date.
Skip if it's the placeholder ("No feed run yet").

---

## Step 3 — Score each role

Score each role on four dimensions (0–3 each). Total 0–12.

- **Match (0–3)** — how directly does the role hit your target signals: right title, right domain (consumer fintech, payments, lending), right seniority?
- **Reach (0–3)** — is this a stretch up, level-appropriate, or a step back? Level-appropriate = 2. Clear stretch up = 3. Step back = 0–1.
- **Edge (0–3)** — do your differentiators (consumer scale, regulatory depth, sole PM ownership) give you a specific advantage here?
- **Sustain (0–3)** — does comp, location, and remote status work? At or above $180K target = 3. At floor ($150K) = 1. Below floor = 0.

**Recommend if total ≥ 7 AND Sustain ≥ 1.** Anything below goes in the Skip section.

Skip immediately (do not score) if: matches avoid list, already in pipeline, matches a rejected pattern in learnings.md.

Injected roles (flagged `injected: true`) always appear in Worth a Look with the reason you added them.

---

## Step 4 — Write feed/feed.md

```markdown
# Job Feed — [DATE]

[N recommended] · [N skipped]

**Fit scoring:** Match (requirements fit) / Reach (level stretch) / Edge (your differentiator advantage) / Sustain (comp + location). Each 0–3, total 0–12. Recommend if ≥7 AND Sustain ≥1.

---

## Recommended

### [Role Title] — [Company] [TARGET] [REPOST]
- **Fit score:** Match [N] / Reach [N] / Edge [N] / Sustain [N] = [total]/12
- **Why this is yours:** [one sentence referencing a specific differentiator, not generic language]
- **Link:** [URL or "direct ATS — no link"]
- **Location:** [location] · [Remote / Hybrid / On-site]
- **Comp:** [band if listed, or "not listed"]

---

<details>
<summary>Skipped ([N])</summary>

### [Role Title] — [Company]
- **Why:** [which filter triggered or score that disqualified it]

</details>

---

_Fetched: [date]. Run `/assess` on any role worth a closer look._
```

---

## Rules

- One sentence per role. This is a scan.
- Do not surface roles already in state.md.
- If today.json is empty or missing, say so and stop.
- British spellings throughout.
