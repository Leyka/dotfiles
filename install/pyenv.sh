#!/usr/bin/env bash

PYTHON_VERSION="3.10"

# Create directory
mkdir -p ~/.pyenv

# Install specific python version globally
if [[ -z "$(pyenv versions | grep $PYTHON_VERSION | tail -1)" ]]; then
  pyenv install $PYTHON_VERSION:latest
  pyenv global $(pyenv versions | grep $PYTHON_VERSION)
else
  echo "Python v$PYTHON_VERSION is already installed."
fi