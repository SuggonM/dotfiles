#!/usr/bin/env sh

# in current directory, list all top-level directories
# except non-packages and hidden ones like .git/
# and separate matches by spaces
find . -maxdepth 1 -type d ! name INSTALL ! -name SYSTEM ! -name '.*' -printf "%f "
