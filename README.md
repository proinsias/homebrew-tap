# homebrew-tap

A private homebrew tap to install various tools.

## Table of contents

<!-- editorconfig-checker-disable -->

<!--
Table of contents updated via:
uvx --from md-toc md_toc --in-place github -- README.md
-->
<!--TOC-->

- [homebrew-tap](#homebrew-tap)
- [Table of contents](#table-of-contents)
- [Repository layout](#repository-layout)
- [Installing these tools](#installing-these-tools)
- [Contributing](#contributing)
- [Setup](#setup)
- [Adding a new formula](#adding-a-new-formula)
- [Updating an existing formula](#updating-an-existing-formula)

<!--TOC-->

## Repository layout

```text
├── README.md                  # Project documentation
├── AGENTS.md                  # AI coding assistant instructions
└── Formula/                   # Homebrew formula
    └── claudelint.rb          # https://github.com/pdugan20/claudelint
```

<!-- editorconfig-checker-enable -->

## Installing these tools

```shell
brew tap proinsias/tap

# https://github.com/pdugan20/claudelint
brew install proinsias/tap/claudelint

```

## Contributing

### Setup

```shell
# Install mise via https://mise.jdx.dev/installing-mise.html .
curl https://mise.run | sh

# Install developer tools.
mise install

# Install prek git hooks.
prek install --install-hooks --allow-missing-config
```

### Adding a new formula

1. Create `Formula/<name>.rb` using the conventions above.
2. Sync to the tap directory and fix permissions.
3. Run `brew audit --strict --online <formula>` — fix all findings.
4. Run `brew install --build-from-source proinsias/tap/<formula>`.
5. Run `brew test proinsias/tap/<formula>`.
6. Commit with a `feat:` conventional commit message.

### Updating an existing formula

1. Update `url` and `sha256` in `Formula/<name>.rb`.
2. Follow steps 2–6 above, using `fix:` or `chore:` as appropriate.
