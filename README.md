# dotfiles
Stash of my user+system configs

The configs in this repo follow the [GNU Stow](https://www.gnu.org/software/stow/) package-style layout.

## PSA
If you're searching for [ricing](https://www.reddit.com/r/unixporn/) and eye-candy stuff, this is the wrong place.

## Usage

> [!Note]
> For `stow` to work "as-intended", the cloned local directory must be a direct child of `$HOME`.

> [!Tip]
> `$package` means any top-level directory in this repo.

> [!Warning]
> Do NOT use `*` glob. Expand [`all.sh`](all.sh) instead.

---

Clone the repo:
```bash
git clone https://github.com/SuggonM/dotfiles ~/suggon-dotfiles
```

Stow a specific package:
```bash
stow $package
```

Unstow a specific package (i.e. revert the symlink creation):
```bash
stow -D $package
```

Stow all packages:
```bash
stow $(./all.sh)
```

Stow [`SYSTEM/`](SYSTEM) packages:
```bash
cd SYSTEM/
sudo stow -t / $package
```
