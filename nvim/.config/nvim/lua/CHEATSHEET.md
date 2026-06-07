# Neovim Cheatsheet
> **LEADER** = `Space`

---

## Files
| Key | Action |
|-----|--------|
| `Space ff` | Search and open a file |
| `Space fg` | Search inside file contents |
| `Space fb` | Switch between open files |
| `Space ?` | Open this cheatsheet |
| `Space d` | Go back to dashboard |

## Git
| Key | Action |
|-----|--------|
| `]g` / `[g` | Jump to next / previous change |
| `Space gp` | Preview the change |
| `Space gb` | Show who wrote this line |
| `Space gs` | Stage this change (add to next commit) |
| `Space gr` | Undo this change |

## Editing
| Key | Action |
|-----|--------|
| `gcc` | Toggle comment on a line |
| `gc` | Toggle comment on selection |
| `cs"'` | Change surrounding quotes `"foo"` → `'foo'` |
| `ds"` | Remove surrounding quotes `"foo"` → `foo` |
| `ysiw"` | Add surrounding quotes `foo` → `"foo"` |

## Autocomplete
| Key | Action |
|-----|--------|
| `Tab` | Next suggestion |
| `Shift+Tab` | Previous suggestion |
| `Enter` | Confirm suggestion |
| `Ctrl+Space` | Force open suggestions |

## Navigation
| Key | Action |
|-----|--------|
| `Ctrl+h/j/k/l` | Move between panes |
| `Ctrl+O` | Go back to previous file |
| `Ctrl+I` | Go forward |
| `< / >` | Indent / unindent selection |
| `J / K` | Move selected lines up / down |
| `Esc` | Clear search highlight |

## Plugins
| Command | Action |
|---------|--------|
| `:Lazy` | Open plugin manager |
| `:Lazy sync` | Update all plugins |

---

## Glossary
| Word | Meaning |
|------|---------|
| **buffer** | A file loaded in memory |
| **pane / split** | A divided window showing multiple files |
| **visual mode** | Text selection mode, press `v` to enter |
| **yank** | Copy (`y` = Ctrl+C in vim) |
| **leader** | A prefix key for shortcuts = `Space` |
| **telescope** | Fuzzy file/text search UI |
| **gitsigns** | Git change indicators in the left margin |
| **hunk** | A block of changed lines in a git diff |
