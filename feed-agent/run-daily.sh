#!/bin/bash
# Daily job feed runner — called by launchd at 8am
# Logs to feed-agent/run.log

set -euo pipefail

AGENT_DIR="/Users/anjali/Documents/Claude/agents/job-agent"
LOG="$AGENT_DIR/feed-agent/run.log"
CLAUDE="/Users/anjali/.local/bin/claude"
PYTHON="/Users/anjali/Documents/Claude/agents/job-agent/feed-agent/.venv/bin/python3"

cd "$AGENT_DIR"

echo "--- $(date '+%Y-%m-%d %H:%M:%S') ---" >> "$LOG"

echo "Fetching roles..." >> "$LOG"
"$PYTHON" feed-agent/fetch.py >> "$LOG" 2>&1

echo "Scoring feed..." >> "$LOG"
"$CLAUDE" --model claude-haiku-4-5-20251001 --dangerously-skip-permissions -p "/feed" >> "$LOG" 2>&1

echo "Notifying..." >> "$LOG"
bash feed-agent/notify.sh

echo "Done." >> "$LOG"
