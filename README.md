# dotfiles (ADB shell)
Stash of my ADB shell environment configs

## Why?
Because using the built-in `mksh` and editing text using pipes and redirects like a caveman is insanity!

Luckily, a kind stranger has already saved us the headache of cross-compiling :)

https://github.com/bnsmb/binaries-for-Android

## Setup Instructions

> [!NOTE]
> All commands displayed here are run inside ADB shell.

1. `cd` to the special `shell`-owned path. This will be our `$HOME`[^1]
   ```sh
   cd /data/local/tmp
   ```

2. Get the `bash` and `vim` binaries from [binaries-for-Android](https://github.com/bnsmb/binaries-for-Android/tree/main/binaries)
   ```sh
   binaries="https://github.com/bnsmb/binaries-for-Android/raw/refs/heads/main/binaries"
   curl -LO $binaries/bash
   curl -L -o vim $binaries/vim-9.2  # select whichever version is available
   ```

3. Make them executable and move to `bin/`
   ```sh
   chmod +x bash vim
   mkdir bin
   mv bash vim -t bin/
   ```

4. Get `.bashrc` and `.vimrc` from this repo
   ```sh
   dots="https://github.com/SuggonM/dotfiles/raw/refs/heads/adb-shell"
   curl -LO $dots/.bashrc
   curl -LO $dots/.vimrc
   curl -LO $dots/_bash
   chmod +x _bash
   ```

5. Get the Vim runtime
   ```sh
   curl -LO https://codeload.github.com/vim/vim/zip/refs/heads/master
   unzip master 'vim-master/runtime/*'
   mkdir -p sysroot/usr/share/vim
   mv vim-master/runtime sysroot/usr/share/vim
   rm -r master vim-master
   ```

6. Run the bash wrapper to enter bash
   ```sh
   /data/local/tmp/_bash
   ``` 

[^1]: Unlike the name `tmp` suggests, [it's persistent](https://android.stackexchange.com/questions/220504/what-and-when-clears-content-of-data-local-tmp).
