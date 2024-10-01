#!/bin/bash

# Get the current working directory
CURRENT_DIR=$(pwd)
DOCKER_COMPOSE_FILE="$CURRENT_DIR/docker/docker-compose.yml"

# Check if Homebrew is installed
if ! type brew > /dev/null; then
    # Homebrew is not installed, install it
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"   
else
    echo "Homebrew is already installed..."
fi

# Use brew bundle to install from Brewfile (if it exists)
if [[ -f Brewfile ]]; then
  brew bundle
else
  echo "Brewfile not found. Skipping installation from Brewfile..."
fi

# Check if a folder path is provided
if [[ -n "$CURRENT_DIR/zsh" ]]; then
  # Copy .zshrc from the specified folder relative to the current working directory
  cp "$CURRENT_DIR"/zsh/.zshrc ~/.zshrc

  echo ".zshrc copied from $CURRENT_DIR/zsh/.zshrc to ~/.zshrc."
  echo "need to do manually source ~/.zshrc after this..."
else
  echo "$CURRENT_DIR/zsh/.zshrc not provided. Skipping .zshrc copying."
fi

# Setup docker-compose
docker-compose -f "$DOCKER_COMPOSE_FILE" up -d