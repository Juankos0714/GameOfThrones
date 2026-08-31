-- =====================================================
-- Better Auth tables
-- Generated for Better Auth v1.7
-- These tables are required by Better Auth and must be
-- created before running the server.
-- =====================================================

-- Core user table (Better Auth expects this exact structure)
CREATE TABLE IF NOT EXISTS "user" (
  id TEXT PRIMARY KEY DEFAULT (
    lower(
      replace(
        replace(
          replace(
            cast(gen_random_uuid() as text),
            '-', ''
          ),
          upper(cast(gen_random_uuid() as text)),
          ''
        ),
        '', ''
      )
    )
  ),
  name TEXT NOT NULL DEFAULT '',
  email TEXT NOT NULL UNIQUE,
  "emailVerified" BOOLEAN NOT NULL DEFAULT FALSE,
  image TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- Session table
CREATE TABLE IF NOT EXISTS session (
  id TEXT PRIMARY KEY DEFAULT (
    replace(
      replace(
        cast(gen_random_uuid() as text),
        '-', ''
      ),
      '',
      ''
    )
  ),
  "userId" TEXT NOT NULL REFERENCES "user"(id) ON DELETE CASCADE,
  "expiresAt" TIMESTAMPTZ NOT NULL,
  token TEXT NOT NULL UNIQUE,
  ipAddress TEXT,
  userAgent TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- Account table (for email/password and future OAuth)
CREATE TABLE IF NOT EXISTS account (
  id TEXT PRIMARY KEY DEFAULT (
    replace(
      replace(
        cast(gen_random_uuid() as text),
        '-', ''
      ),
      '',
      ''
    )
  ),
  "userId" TEXT NOT NULL REFERENCES "user"(id) ON DELETE CASCADE,
  accountId TEXT NOT NULL,
  providerId TEXT NOT NULL,
  "password" TEXT,
  access_token TEXT,
  refresh_token TEXT,
  id_token TEXT,
  access_token_expires_at TIMESTAMPTZ,
  refresh_token_expires_at TIMESTAMPTZ,
  scope TEXT,
  id_token_expires_at TIMESTAMPTZ,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- Verification table (for email verification, password reset, etc.)
CREATE TABLE IF NOT EXISTS verification (
  id TEXT PRIMARY KEY DEFAULT (
    replace(
      replace(
        cast(gen_random_uuid() as text),
        '-', ''
      ),
      '',
      ''
    )
  ),
  identifier TEXT NOT NULL,
  value TEXT NOT NULL,
  "expiresAt" TIMESTAMPTZ NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- Indexes for Better Auth tables
CREATE INDEX IF NOT EXISTS idx_session_userId ON session("userId");
CREATE INDEX IF NOT EXISTS idx_session_token ON session(token);
CREATE INDEX IF NOT EXISTS idx_account_userId ON account("userId");
CREATE INDEX IF NOT EXISTS idx_account_providerId ON account("providerId");
CREATE INDEX IF NOT EXISTS idx_verification_identifier ON verification(identifier);
