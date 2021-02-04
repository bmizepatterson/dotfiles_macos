#!/usr/bin/env zsh

echo "\n<<< Installing Visual Studio Code Extensions >>>\n"

cat vscode/vscode_extensions | xargs -n 1 code --install-extension
