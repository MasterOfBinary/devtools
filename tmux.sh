#!/usr/bin/env bash

# Exit if any command fails
set -e

. base

echosuccess "Setting up tmux..."

# Back up existing .tmux.conf
backup "$HOME/.tmux.conf"

# Copy new .tmux.conf
cp tmux/tmux.conf "$HOME/.tmux.conf"

echook
echo