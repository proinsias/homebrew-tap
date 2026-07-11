# AGENTS.md

AI coding assistant instructions for this Homebrew tap repository.

**Important**: You must read and follow all instructions in this file before
working with this repository. These instructions are requirements, not optional
guidance.

## Primary Documentation Source

**Critical**: The [README.md](README.md) is the **single source of truth** for
this folder. You must read and analyze it thoroughly before working with any
code. It may also point you to additional documentation.

**Important**: Do not duplicate information from `README.md` or additional
documentation here. Instead, reference these as the authoritative source.

## Committing to main

This repository permits direct commits to `main`. No branch or pull request (PR)
is required for formula additions and updates.

## Validation (required before every commit)

```bash
brew audit --strict --online <formula>
```

All findings must be resolved. Do not commit with open audit errors.

After changes to the installed tap copy (see [Sync](#sync) below):

```bash
brew install --build-from-source proinsias/tap/<formula>
brew test proinsias/tap/<formula>
```

## Sync

Homebrew reads formulas from its own tap clone at:

```text
/opt/homebrew/Library/Taps/proinsias/homebrew-tap/
```

After editing `Formula/*.rb` in this repo, sync and fix permissions before
auditing or installing:

```bash
cp Formula/<formula>.rb /opt/homebrew/Library/Taps/proinsias/homebrew-tap/Formula/<formula>.rb
chmod a+r /opt/homebrew/Library/Taps/proinsias/homebrew-tap/Formula/<formula>.rb
```

## Formula conventions

### File and class naming

- Filename: `Formula/<name>.rb` — lowercase, hyphens allowed (e.g.,
  `my-tool.rb`)
- Class name: CamelCase, derived from the filename (e.g., `MyTool`)
- File permissions must be world-readable (`a+r`)

### Required fields

```ruby
desc     "Short description under 80 characters, no trailing period"
homepage "https://..."
url      "https://..."           # canonical release archive URL
sha256   "..."                   # SHA-256 of the archive
license  "SPDX-identifier"
```

Compute `sha256` with:

```bash
curl -fsSL <url> | sha256sum
# or
brew fetch --build-from-source Formula/<formula>.rb
```

### Line length

Max 118 characters per line. The `desc` value itself must be under 80
characters.

### npm packages

Use `std_npm_args` (not the deprecated `std_npm_install_args`):

```ruby
depends_on "node"

def install
  system "npm", "install", *std_npm_args(prefix: libexec)
  bin.install_symlink Dir["#{libexec}/bin/*"]
end
```

Do not add `require "language/node"` — it is not needed with `std_npm_args`.

### livecheck

Include a `livecheck` block so `brew livecheck` can detect new upstream
versions:

```ruby
livecheck do
  url :stable   # follows the formula's url field
end
```

Override with a custom strategy only when the release URL does not reflect the
latest version reliably.

### test block

Every formula must have a `test do` block. At minimum, verify the binary runs
and reports the expected version:

```ruby
test do
  assert_match version.to_s, shell_output("#{bin}/<binary> --version")
end
```

## Session Memory

Project memories live in `.agents/memory/` in this repo so they are
version-controlled and loaded into every session via this file.

When saving a new memory for this project, ask the user first:

> "Should this memory be saved to the **repo** (`.agents/memory/`, committed,
> visible to all contributors) or **user-only** (private to your machine)?"

- **Repo memory**: write to `.agents/memory/<slug>.md` and add an
  `@.agents/memory/<slug>.md` line to the list below.
- **User-only memory**: write to the appropriate AI agent-specific file and
  update the `MEMORY.md` index there.
