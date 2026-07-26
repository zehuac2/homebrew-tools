# AGENTS.md

This file gives guidance to AI coding agents. Agents must follow this guidance when they work with code in this repository.

## Documentation language

Write all documentation in this repository in Simplified Technical English (STE). Follow these rules:

- Use short sentences.
- Write one instruction or one fact per sentence.
- Use active voice.
- Use simple, consistent words. Do not use a synonym for a term you already used.
- Do not chain more than three nouns together.
- Avoid complex sentences with many clauses. Split them into separate sentences.
- Use lists for steps and for related items.

This rule applies to this file and to all other documentation in this repository.

## Overview

This repository is a personal Homebrew tap. The repository has no build system and no application code. The repository contains only the `Formula/` directory. The `Formula/` directory contains Ruby formula files. Homebrew reads these files directly. Users install a formula with this command: `brew install zehuac2/tools/<formula>`.

The GitHub account had the name `Zehua-Chen`. The account now has the name `zehuac2`. The git remote is `zehuac2/homebrew-tools`. The tap name is `zehuac2/tools`. All URLs in this repository use the name `zehuac2`. Do not add a URL with the old name `Zehua-Chen`.

Note: GitHub redirects the old owner name to the new owner name. This redirect will stop if another user registers the old name. The formulas `brew-upgrade.rb` and `mise-upgrade.rb` use their `url` value to fetch live data. The `url` value is not only a reference link.

## Commands

Use these commands:

```sh
brew style Formula/<name>.rb            # rubocop lint for formulae
brew audit --strict --online zehuac2/tools/<name>   # full audit, incl. URL/sha checks
brew install --build-from-source zehuac2/tools/<name>
brew test zehuac2/tools/<name>          # runs the formula's `test do` block
brew reinstall zehuac2/tools/<name>     # after editing an already-installed formula
```

For a formula with a `service do` block, use this command: `brew services start|stop|info <name>`.

## Formula categories

This repository has two types of formula. Each type needs a different edit method.

### Prebuilt-binary formulae

Examples: `latextools.rb`, `status-line.rb`.

These formulas point to GitHub Release tarballs. Each platform and architecture needs its own `url` value and `sha256` value. Use `on_macos` and `on_linux` blocks to select the correct values. Use `Hardware::CPU.arm?` to check the CPU architecture.

If a platform has no published build, call `odie` with an explanation. Do not fall through to a wrong URL.

When you bump the version, update these three items together:
- the `version` value
- every `url` value
- every `sha256` value

### Self-contained service formulae

Examples: `brew-upgrade.rb`, `mise-upgrade.rb`.

These formulas ship no upstream artifact. Each formula sets `url` to this repository. Each formula generates its executable inside the `install` step. The formula writes the executable with a heredoc into `bin/`. The formula then runs `chmod 0755` on the executable. Each formula declares a `service do` block with `run_type :cron`.

These formulas have no release artifact. You must update the `version` value by hand. Bump the `version` value to force a reinstall. A reinstall applies script changes.

Note this shell-escaping rule inside the generated scripts:
- Ruby interpolates `#{HOMEBREW_PREFIX}` at install time.
- The shell expands `$HOME` at run time. The service runs as the user. The value of `HOME` is known only at run time.

## status-line.rb is bot-managed

A GitHub Actions bot updates `Formula/status-line.rb`. The bot pushes commits from the upstream repository `zehuac2/status-line`. The bot commits have the author `github-actions[bot]`. The bot commits have this message format: `status-line <version>`.

Do not hand-bump the version number or the sha256 value in this file. The release workflow in the upstream repository updates these values.

You may make structural changes to this formula. Keep structural changes compatible with the bot's future edits.
