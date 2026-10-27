# Security Policy

DemoStar is a demo-mode helper that reads local config files and applies
on-screen masking. It never uploads data anywhere.

## Reporting a Vulnerability

- Please open a private security advisory via GitHub ("Security" tab) or
  contact the maintainer directly.
- Do not open a public issue for exploit details.

## Scope

- Shell scripts in `bin/` and `lib/`
- The install script (`install.sh`)
- Example configs must never contain real credentials (see PR #2 history)
