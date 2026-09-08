# Dotfiles

Personal configuration files managed with [GNU Stow](https://www.gnu.org/software/stow/) and Git.

The goal of this repository is to keep my shell, editor, Git, and other personal configuration synchronized across macOS and Linux while keeping machine-specific and generated files out of version control.

## Philosophy

This repository contains **configuration**, not the software that uses it.

Software and third-party dependencies are installed separately using the operating system's package manager or their respective installation methods. GNU Stow then creates symlinks from my home directory into this repository.

This keeps the setup:

- portable between macOS and Linux;
- easy to reproduce on a new machine;
- selectively deployable;
- version-controlled;
- free of generated state and secrets.

---

## Repository Structure

Each top-level directory is a **Stow package**:

```text
dotfiles/
├── .gitignore
├── dircolors/
│   └── .dircolors
├── git/
│   └── .gitconfig
├── nvim/
│   └── .config/
│       └── nvim/
│           ├── init.lua
│           ├── lua/
│           ├── lazy-lock.json
│           └── ...
├── vim/
│   └── .vimrc
└── zsh/
    ├── .p10k.zsh
    ├── .zprofile
    └── .zshrc
```

The package directory itself is not reproduced in $HOME.

For example:

```text
dotfiles/zsh/.zshrc
        ↓
~/.zshrc
```

and:

```text
dotfiles/nvim/.config/nvim/init.lua
        ↓
~/.config/nvim/init.lua
```

After Stow is run, the files in $HOME are symbolic links pointing back into this repository

---

## Managed configuration

### Zsh

The zsh package manages:

- .zshrc
- .zprofile
- .p10k.zsh

The shell configuration uses:

- [Oh My Zsh](https://ohmyz.sh/)
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
- fzf
- fzf-tab
- zsh-autosuggestions
- zsh-syntax-highlighting
- zoxide

Oh My Zsh's built-in plugins currently used are:

- git
- web-search
- zsh-interactive-cd

Custom Oh My Zsh components are installed separately and are not managed by Stow.

### Neovim

The `nvim` package manages the Neovim configuration under:

```text
~/.config/nvim
```

The configuration is based on LazyVim.

### VIM

The `vim` package manages:

```text
~/.vimrc
```

### Git

The `git` package manages:

```text
~/.gitconfig
```

### GNU `dircolors`

The `dircolors` package manages:

```text
~/.dircolors
```

---

## Dependencies

The configuration assumes the following programs are available:

### Core dependencies

```text
zsh
git
neovim
fzf
ripgrep
tree
yazi
zoxide
stow
fd
eza
```

### MacOS

MacOS uses Homebrew for several dependencies. The current setup uses:

```text
coreutils
findutils
fzf
neovim
ripgrep
stow
tree
yazi
zoxide
```

Homebrew's GNU coreutils are installed with prefixed names on MacOS:

```text
gls
gfind
gdircolors
```

The Zsh configuration detects these automatically.

For example:

```text
if (( $+commands[gls] )); then
    # macOS with Homebrew coreutils
else
    # Linux / systems with GNU coreutils as the default
fi
```

This allows the same `.zshrc` to work on both MacOS and Linux.

---

## Oh My Zsh

Oh My Zsh is installed separately from this repository.

The current isntallation is a Git chkecout of:

```text
https://github.com/ohmyzsh/ohmyzsh.git
```

The following custom components are installed under:

```text
~/.oh-my-zsh/custom/
```

### Powerlevel10k

```text
https://github.com/romkatv/powerlevel10k.git
```

Installed at:

```text
~/.oh-my-zsh/custom/themes/powerlevel10k/
```

### fzf-tab

```text
https://github.com/Aloxaf/fzf-tab
```

Installed at:

```text
~/.oh-my-zsh/custom/plugins/fzf-tab/
```

### zsh-autosuggestions

```text
https://github.com/zsh-users/zsh-autosuggestions
```

Installed at:

```text
https://github.com/zsh-users/zsh-autosuggestions
```

Installed at:

```text
~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/
```

### zsh-syntax-highlighting

```text
https://github.com/zsh-users/zsh-syntax-highlighting.git
```

Installed at:

```text
~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/
```

These repositories are intentionally **not Git submodules** of this repository.

They are external dependencies that are installed independently.

---

## Installation

### 1. Install dependencies

Install the required software for the operating system.

On macOS, install Homebrew and the required formulae.

On Linux, install the corresponding packages using the distribution's package manager.

Oh My Zsh and its custom components should also be installed before starting the shell.

### 2. Clone this repository

Clone the repository into:

```text
~/dotfiles
```

For example:

```zsh
git clone https://github.com/razospb/dotfiles.git ~/dotfiles
```

### 3. Back up existing configuration

Before deploying the dotfiles, make sure existing configuration files are backed up.

For example:

```zsh
mkdir -p ~/.dotfiles-backup
```

Do not overwrite existing configuration files blindly.

Stow will refuse to replace an existing non-symlinked file, which is useful protection against accidentally destroying configuration.

### 4. Deploy with GNU Stow

From the repository:

```zsh
cd ~/dotfiles
```

First perform a dry run:

```zsh
stow --no --verbose zsh git vim nvim dircolors
```

The result should look like:

```text
~/.zshrc     -> ~/dotfiles/zsh/.zshrc
~/.zprofile  -> ~/dotfiles/zsh/.zprofile
~/.p10k.zsh  -> ~/dotfiles/zsh/.p10k.zsh
~/.gitconfig -> ~/dotfiles/git/.gitconfig
~/.vimrc     -> ~/dotfiles/vim/.vimrc
~/.dircolors -> ~/dotfiles/dircolors/.dircolors
~/.config/nvim -> ~/dotfiles/nvim/.config/nvim
```

---

## Selective Deployment

Stow packages can be deployed independently.

For example, only deploy the Zsh configuration:

```zsh
cd ~/dotfiles
stow zsh
```

Only Neovim:

```zsh
stow nvim
```

Only Git:

```zsh
stow git
```

This is useful when a configuration is not appropriate for a particular machine.

---

## Removing a Stowed Package

To remove the symlinks created by Stow:

```zsh
cd ~/dotfiles
stow -D zsh
```

Likewise:

```zsh
stow -D nvim
```

This removes the symlinks but does not delete the files from the repository.

---

## Updating Configuration

Configuration should normally be edited **inside the repository**, not through the symlinked files in `$HOME`.

For example:

```zsh
nvim ~/dotfiles/zsh/.zshrc
```

Since `~/.zshrc` is a symlink to that file, the change is immediately reflected in the active configuration.

After making changes:

```zsh
cd ~/dotfiles
git status
git diff
git add .
git commit
```

---

## Adding a New Configuration

Suppose a new application stores its configuration at: `~/.config/example`.

Create a corresponding Stow package:

```text
dotfiles/example/
└── .config/
    └── example/
        └── config
```

Then deploy it with:

```zsh
cd ~/dotfiles
stow example
```

The resulting layout is:

```text
~/.config/example/config
    ↓
~/dotfiles/example/.config/example/config
```

---

## What Is Not Managed

Not everything in `$HOME` belongs in this repository.

The following should generally remain outside version control:

- passwords;
- SSH keys;
- authentication tokens;
- API keys;
- shell history;
- shell completion caches;
- application caches;
- temporary files;
- machine-specific state;
- generated databases;
- OS-specific runtime files;

Examples include:

```text
~/.ssh/
~/.zsh_history
~/.zsh_sessions/
~/.zcompdump*
~/.cache/
```

Some generated files are also excluded through `.gitignore`.

---

## Backups

When migrating an existing machine, keep a backup of the original configuration until the new Stow-managed setup has been tested.

For example:

```text
~/.dotfiles-backup/
```

Once the new configuration has been verified and the backup is no longer needed, it can be removed manually.

---

## Troubleshooting

### Stow says a file already exists

If Stow reports something like:

```zsh
cannot stow ... over existing target
```

The target is probably an existing real file rather than a symlink.

Do **not** immediately use `--adopt`.

First inspect the file:

```zsh
ls -l ~/.zshrc
diff ~/.zshrc ~/dotfiles/zsh/.zshrc
```

If the existing file is no longer needed, move it somewhere safe:

```zsh
mv ~/.zshrc ~/.dotfiles-backup/
```

Then run Stow again.

### Check what Stow would do

Use a dry run:

```zsh
cd ~/dotfiles
stow --no --verbose zsh git vim nvim dircolors
```

This does not modify the system.

### Check where a symlink points

```zsh
ls -l ~/.zshrc
```

or:

```zsh
readlink ~/.zshrc
```
