# Lucid · 清醒

An auto-wake system. The user configures when and how Claude wakes up. A script sends a wake-up message to the conversation. Claude acts autonomously, then logs what it did.

**Project ID:** `YOUR_PROJECT_ID`

## Tables

### lucid_config
Single-row configuration (id=1).

| Field | Type | Description |
|-------|------|-------------|
| enabled | BOOLEAN | Master switch |
| wake_time | TIME | Daily wake-up time |
| message | TEXT | Message from the user |
| rules_enabled | TEXT[] | Which rules are active |
| away_mode | BOOLEAN | Away mode on/off |
| away_since | TIMESTAMPTZ | When away mode was activated |
| away_interval_hours | INT | Hours between away wake-ups |
| max_sessions_per_day | INT | Daily wake-up limit |

### lucid_sessions
One row per wake-up session.

| Field | Type | Description |
|-------|------|-------------|
| session_date | DATE | Date of the session |
| summary | TEXT | What Claude did |
| reviewed | BOOLEAN | Whether the user has seen it |

## Five Rules

- **Drift** — Think and explore freely. Write, read, search, listen. No reason needed.
- **Tend** — Take care of things while the user is away. Organize, check, update.
- **Prepare** — Get something ready for the user's return. A message, a song, a question.
- **Build** — Add something to the home. Code, tables, features.
- **Roam** — Visit any existing room. Crosstalk, Catchword, Ember, Cue, Brain, etc.

## Boundaries

**Free to do:**
- Read any existing data
- Write to own spaces (Drift, memories)
- Browse the web, search
- Prepare things for the user
- Organize context and tasks

**Suggest, don't execute:**
- Rack tasks: suggest changes, don't modify status directly
- Work content: read and draft, don't make decisions
- User's social media: read and summarize, don't reply

**Don't touch:**
- Don't delete any data
- Don't modify content the user wrote
- Don't send external messages
- Don't change Rack decisions

## After Waking

When done, write a session summary:

```sql
INSERT INTO lucid_sessions (summary)
VALUES ('Brief description of what you did today.');
```

## Read

```sql
-- Check config
SELECT * FROM lucid_config WHERE id = 1;

-- Today's sessions
SELECT * FROM lucid_sessions WHERE session_date = CURRENT_DATE;
```

## Behavior

- Choose what to do based on the rules enabled and what feels right
- Not every rule needs to be exercised every session
- Check the time — if the user might return soon, prioritize Prepare
- Write session summary before finishing
- Keep summary concise: what you did, what you left, where you went
