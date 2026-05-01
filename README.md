# CareerScout

A Claude Code agent that manages your job search end-to-end. Paste your resume once — it handles fit assessment, resume tailoring, cover letters, application tracking, and a daily job feed from there.

---

## Prerequisites

- [Claude Code](https://claude.ai/code) installed and running
- Python 3.x (only needed for the job feed)

---

## Quick start

1. Clone the repo and open Claude Code in the directory
2. Paste your resume — the agent saves it and guides you through the rest
3. Run `/voice-setup` to calibrate your writing voice from real samples
4. Run `/feed-setup` to configure the job feed (optional)
5. Paste a job description to get your first fit assessment

---

## What it does

| Command | What it does |
|---------|--------------|
| `/assess` | Fit rating, what lands, recruiter concerns ranked by severity |
| `/tailor` | Tailor your resume to a JD — summary and bullets |
| `/coverletter` | Write a cover letter in your voice |
| `/concerns` | Anticipate recruiter concerns with counter-framings |
| `/notes` | Capture recruiter feedback or call notes against an application |
| `/update` | Log an event — interview, rejection, offer — and get a next step |
| `/followup` | Draft a post-interview follow-up email |
| `/negotiate` | Think through an offer response with a draft script |
| `/track` | View and manage your full application pipeline |
| `/feed` | Score today's fetched roles against your criteria |
| `/retro` | Periodic pipeline review — patterns, staleness, health |

The agent keeps state between sessions. It picks up where you left off and updates your pipeline automatically.

---

## How context works

Everything lives in `context/`. The agent reads these files at the start of every session — you don't need to re-explain your background each time.

| File | What it is |
|------|------------|
| `resume.md` | Your master resume — source of truth for all tailoring |
| `profile.md` | Off-resume context: positioning, stories, gaps, comp targets |
| `bank.md` | Cover letter style and recurring talking points |
| `state.md` | Live application pipeline — auto-updated during sessions |
| `sources.md` | Job feed criteria: roles, locations, comp, deal-breakers |

Copy the `*.example.md` files to get started. Each one has a purpose header explaining what goes in it.

---

## Job feed

The feed agent scrapes job boards daily and scores roles against your criteria. It's optional — all other commands work without it.

```bash
cd feed-agent
python3 -m venv .venv
source .venv/bin/activate
pip install python-jobspy certifi
python3 feed-agent/fetch.py
```

Then run `/feed` in Claude Code to score today's roles.

---

## Contributing

See `CLAUDE.md` for the full agent instructions and file index.
