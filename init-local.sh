#!/usr/bin/env bash

set -euo pipefail

CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/nvim"
LOCAL_DIR="$CONFIG_DIR/lua/local"

mkdir -p \
    "$LOCAL_DIR/core" \
    "$LOCAL_DIR/plugins" \
    "$LOCAL_DIR/lsp" \
    "$LOCAL_DIR/treesitter"

create_lua_table() {
    local file="$1"

    if [[ ! -e "$file" ]]; then
        printf 'return {\n}\n' >"$file"
        echo "Created $file"
    fi
}

create_empty_lua() {
    local file="$1"

    if [[ ! -e "$file" ]]; then
        touch "$file"
        echo "Created $file"
    fi
}

create_empty_lua "$LOCAL_DIR/core/options.lua"
create_empty_lua "$LOCAL_DIR/core/keymaps.lua"

create_lua_table "$LOCAL_DIR/lsp/servers.lua"
create_lua_table "$LOCAL_DIR/treesitter/parsers.lua"

echo
echo "Local Neovim configuration initialized:"
echo "  $LOCAL_DIR"
