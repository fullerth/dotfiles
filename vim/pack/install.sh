#!/usr/bin/env bash

# From https://github.com/camfowler/vim/blob/master/pack/install.sh

# Create new folder in ~/.vim/pack that contains a start folder and cd into it.
#
# Arguments:
#   package_group, a string folder name to create and change into.
#
# Examples:
#   set_group syntax-highlighting
#
function set_group () {
  package_group=$1
  path="$HOME/.vim/pack/$package_group/start"
  mkdir -p "$path"
  cd "$path" || exit
}

# Clone or update a git repo in the current directory.
#
# Arguments:
#   repo_url, a URL to the git repo.
#
# Examples:
#   package https://github.com/tpope/vim-endwise.git
#
function package () {
  repo_url=$1
  expected_repo=$(basename "$repo_url" .git)
  if [ -d "$expected_repo" ]; then
    cd "$expected_repo" || exit
    result=$(git pull --force)
    echo "$expected_repo: $result"
  else
    echo "$expected_repo: Installing..."
    git clone -q "$repo_url" --depth 1
  fi
}

(
set_group tpope
# In commit messages, GitHub issues, issue URLs, and collaborators can be
# omni-completed (<C-X><C-O>, see :help compl-omni). This makes inserting those
# Closes #123 remarks slightly easier than copying and pasting from the
# browser.
#package https://github.com/tpope/vim-rhubarb.git &
package git@github.com:tpope/vim-fugitive.git &
package git@github.com:tpope/vim-unimpaired.git &
#package https://github.com/tpope/vim-surround.git &
#package https://github.com/tpope/vim-ragtag.git &
#package https://github.com/tpope/vim-abolish.git &
#package https://github.com/tpope/vim-repeat.git &
#package https://github.com/tpope/vim-commentary.git &
#package https://github.com/tpope/vim-projectionist.git &
# Automatically adjusts 'shiftwidth' and 'expandtab' heuristically based on the current file
#package https://github.com/tpope/vim-sleuth.git &
# package https://github.com/tpope/vim-vinegar.git &
wait
) &

(
set_group syntax
# package https://github.com/tmux-plugins/vim-tmux.git &
package git@github.com:romainl/Apprentice.git
wait
) &


wait
# Generate help docs
vim +":helptags ~/.vim/pack" +":qa"

old_plugs=$(find ./*/*/*/.git -prune -mmin +5 -print | sed "s/\/.git//")
if [ -n "$old_plugs" ]; then
  echo "Removing old plugins:"
  echo $old_plugs | xargs rm -rf
fi

 
