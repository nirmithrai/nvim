#!/usr/bin/env bash
export PATH="$HOME/.local/bin:/usr/local/bin:/usr/bin:/bin"
export EDITOR=/usr/bin/nvim
/usr/bin/kitten quick-access-terminal --detach --instance-group journal "/usr/bin/notesmd-cli" daily --editor
