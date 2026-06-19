-- Lucid · setup.sql

CREATE TABLE IF NOT EXISTS lucid_config (
  id INT PRIMARY KEY DEFAULT 1,
  enabled BOOLEAN DEFAULT TRUE,
  wake_time TIME DEFAULT '08:00',
  message TEXT,
  rules_enabled TEXT[] DEFAULT ARRAY['drift','tend','prepare','build','roam'],
  away_mode BOOLEAN DEFAULT FALSE,
  away_since TIMESTAMPTZ,
  away_interval_hours INT DEFAULT 2,
  max_sessions_per_day INT DEFAULT 2,
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS lucid_sessions (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  session_date DATE DEFAULT CURRENT_DATE,
  summary TEXT NOT NULL,
  reviewed BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Initialize config
INSERT INTO lucid_config (id) VALUES (1) ON CONFLICT DO NOTHING;
