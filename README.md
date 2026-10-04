# Homebrew tap for novaos-cli

This tap installs [`novaos-cli`](https://github.com/OrbitronAI-Repo/novaos-cli), the command-line tool for building, running and publishing NovaOS agents, on macOS (arm64, x64) and Linux (x64, arm64).

## Install

```bash
brew install orbitronai-repo/novaos/novaos-cli
```

Or tap once, trust the formula, and install it by its short name:

```bash
brew tap orbitronai-repo/novaos
brew trust --formula orbitronai-repo/novaos/novaos-cli
brew install novaos-cli
```

Homebrew only loads formulae from taps outside Homebrew itself once they are trusted. Installing by the full name, as in the first command, trusts that one formula.

Check the installation:

```bash
novaos-cli --version
```

## Upgrade

```bash
brew update
brew upgrade novaos-cli
```

## Uninstall

```bash
brew uninstall novaos-cli
brew untap orbitronai-repo/novaos
```

## About this repository

This repository is generated: each stable release of `novaos-cli` rewrites the formula, and changes made here directly are overwritten. Report problems and ask questions in the [novaos-cli repository](https://github.com/OrbitronAI-Repo/novaos-cli/issues).
