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
├── README.md                             # Project documentation
├── AGENTS.md                             # AI coding assistant instructions
└── Formula/                              # Homebrew formula
    ├── carbon-now-cli.rb                 # https://github.com/mixn/carbon-now-cli
    ├── claudelint.rb                     # https://claudelint.com
    ├── fkill-cli.rb                      # https://github.com/sindresorhus/fkill-cli
    ├── lineselect-rs.rb                  # https://github.com/urbanogilson/lineselect
    ├── lineselect.rb                     # https://github.com/chfritz/lineselect
    ├── prettier-plugin-sh.rb             # https://github.com/un-ts/prettier/tree/master/packages/sh
    ├── v8r.rb                            # https://github.com/chris48s/v8r
    └── yaml-update-last-modified-date.rb # https://github.com/proinsias/yaml-update-last-modified-date
```

<!-- editorconfig-checker-enable -->

## Installing these tools

For example:

```shell
brew tap proinsias/tap

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
2. Run `brew audit --strict --online <formula>` — fix all findings.
3. Run `brew install --build-from-source proinsias/tap/<formula>`.
4. Run `brew test proinsias/tap/<formula>`.
5. Commit with a `feat:` conventional commit message.

### Updating an existing formula

1. Update `url` and `sha256` in `Formula/<name>.rb`.
2. Follow steps 2–5 above, using `fix:` or `chore:` as appropriate.
