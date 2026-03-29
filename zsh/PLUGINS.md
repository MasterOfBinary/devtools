# Zsh Plugin Guide

This zsh setup uses [zinit](https://github.com/zdharma-continuum/zinit) as a
plugin manager with [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
as the prompt theme. Below is a detailed guide to every plugin and how to use it.

---

## Plugin Manager: zinit

Zinit manages all plugins. It downloads and caches them automatically on first
shell launch.

### Useful commands

| Command | Description |
|---|---|
| `zinit update` | Update all plugins |
| `zinit update <plugin>` | Update a specific plugin (e.g. `zinit update zsh-users/zsh-autosuggestions`) |
| `zinit delete <plugin>` | Remove a plugin |
| `zinit list` | List loaded plugins |
| `zinit times` | Show plugin load times (useful for profiling startup) |
| `zinit self-update` | Update zinit itself |

---

## Theme: Powerlevel10k

A fast, flexible prompt theme with git status, exit codes, execution time, and
contextual segments.

### Key features

- **Instant prompt** — the prompt appears immediately while plugins load in the
  background.
- **Transient prompt** — previous prompts collapse to a minimal form so your
  scrollback stays clean.
- **Git status** — shows branch, dirty/clean state, ahead/behind counts,
  stashes, untracked files.
- **Command duration** — shows execution time for long-running commands.
- **Context segments** — language versions (Go, Node, Python, etc.) appear
  automatically when you're in a relevant project directory.
- **Exit code** — prompt character turns red when the last command failed.

### Reconfigure

Run `p10k configure` at any time to re-run the interactive setup wizard and
change your prompt style (lean, classic, rainbow, etc.), icon set, spacing, and
more.

### Configuration file

The full configuration lives in `~/.p10k.zsh`. You can edit it directly to
fine-tune segments, colors, and icons. Changes take effect in new shells or
after running `source ~/.p10k.zsh`.

---

## Plugin: zsh-autosuggestions

Suggests commands as you type based on your history, similar to fish shell.

### Usage

| Action | Key |
|---|---|
| Accept the full suggestion | `→` (right arrow) or `End` |
| Accept the next word only | `Alt+→` (Alt + right arrow) |
| Dismiss the suggestion | Keep typing or `Esc` |

Suggestions appear in grey text after your cursor. Just start typing a command
you've used before and it will appear.

### Tips

- The more you use your shell, the better suggestions get — they're based on
  your command history.
- If a suggestion is partially right, press `Alt+→` to accept it word by word.

---

## Plugin: zsh-completions

Adds hundreds of additional tab-completion definitions for common tools and
commands (e.g. Docker, Cargo, Gradle, Homebrew, systemctl, and many more).

### Usage

Just press `Tab` as you normally would. This plugin works silently in the
background — you'll notice completions working for tools that wouldn't have
them otherwise.

Press `Tab` twice to see all available completions in a menu. Use arrow keys to
navigate the menu.

---

## Plugin: zsh-syntax-highlighting

Highlights commands as you type them, giving immediate visual feedback about
whether a command is valid.

### Color meanings

| Color | Meaning |
|---|---|
| **Green** | Valid command (exists in PATH, is an alias, or builtin) |
| **Red** | Unknown command (typo, not installed) |
| **Underline** | Valid file path |
| **Yellow/Magenta** | Strings, quoted arguments |

### Usage

This plugin works automatically. Just type and watch the colors. If a command
turns red, you know it's wrong before you even press Enter.

---

## OMZ Snippet: git

Provides a large set of git aliases and functions.

### Most useful aliases

| Alias | Command | Description |
|---|---|---|
| `gst` | `git status` | Show working tree status |
| `ga` | `git add` | Stage files |
| `gaa` | `git add --all` | Stage all changes |
| `gc` | `git commit --verbose` | Commit with diff shown |
| `gc!` | `git commit --verbose --amend` | Amend last commit |
| `gcmsg` | `git commit --message` | Commit with inline message |
| `gco` | `git checkout` | Switch branches |
| `gcb` | `git checkout -b` | Create and switch to new branch |
| `gd` | `git diff` | Show unstaged changes |
| `gds` | `git diff --staged` | Show staged changes |
| `gl` | `git pull` | Pull from remote |
| `gp` | `git push` | Push to remote |
| `gpf!` | `git push --force` | Force push |
| `glog` | `git log --oneline --decorate --graph` | Pretty log |
| `gloga` | `git log --oneline --decorate --graph --all` | Pretty log (all branches) |
| `gb` | `git branch` | List branches |
| `gbd` | `git branch --delete` | Delete branch |
| `gm` | `git merge` | Merge |
| `grb` | `git rebase` | Rebase |
| `grbi` | `git rebase --interactive` | Interactive rebase |
| `gsta` | `git stash push` | Stash changes |
| `gstp` | `git stash pop` | Pop stash |
| `gcp` | `git cherry-pick` | Cherry-pick a commit |

Run `alias | grep git` to see the full list.

---

## OMZ Snippet: last-working-dir

Automatically saves and restores the directory you were in when you last closed
your terminal.

### Usage

Completely automatic — no commands needed. Open a new terminal and you'll be in
the same directory where you left off.

---

## OMZ Snippet: golang

Provides aliases and environment setup for Go development.

### Aliases

| Alias | Command | Description |
|---|---|---|
| `gob` | `go build` | Build |
| `goc` | `go clean` | Clean build cache |
| `god` | `go doc` | View documentation |
| `gof` | `go fmt` | Format code |
| `gofa` | `go fmt ./...` | Format all code |
| `gog` | `go get` | Download dependencies |
| `goi` | `go install` | Install package |
| `gol` | `go list` | List packages |
| `gor` | `go run` | Run |
| `got` | `go test` | Run tests |
| `gov` | `go vet` | Vet code |
| `gom` | `go mod` | Module management |
| `gomi` | `go mod init` | Init module |
| `gomt` | `go mod tidy` | Tidy module |

---

## OMZ Snippet: history

Provides aliases for searching and managing command history.

### Aliases

| Alias | Command | Description |
|---|---|---|
| `h` | `history` | Show history |
| `hs` | `history \| grep` | Search history |
| `hsi` | `history \| grep -i` | Case-insensitive history search |

### Tips

- Press `Ctrl+R` to interactively search through your command history
  (reverse-i-search).
- Press `↑`/`↓` to navigate through previous commands.
- Type the beginning of a command and press `↑` to search history for commands
  starting with that prefix.

---

## OMZ Snippet: sudo

Press `Esc` twice to prepend `sudo` to the current or previous command.

### Examples

- Type `apt update`, realize you need sudo → press `Esc` `Esc` → becomes
  `sudo apt update`
- Run a command that fails with permission denied → press `Esc` `Esc` on an
  empty prompt → previous command is recalled with `sudo` prepended

---

## Other: z (directory jumper)

The [z](https://github.com/rupa/z) script tracks the directories you visit and
lets you jump to them with partial name matches.

### Usage

| Command | Description |
|---|---|
| `z foo` | Jump to the most "frecent" (frequent + recent) directory matching `foo` |
| `z foo bar` | Jump to a directory matching both `foo` and `bar` |
| `z -l foo` | List all matching directories ranked by frecency |
| `z -r foo` | Match by recency only |
| `z -t foo` | Match by frequency only |

### Examples

```
# After visiting /home/user/projects/myapp a few times:
z myapp          # jumps to /home/user/projects/myapp
z proj           # jumps to /home/user/projects (or whichever match ranks highest)
z my             # jumps to the top "frecent" dir matching "my"
```

### Tips

- z learns as you use `cd`. The more you visit a directory, the higher it ranks.
- Matches are case-insensitive.
- Use `z -l` to see what z knows about and debug unexpected jumps.
