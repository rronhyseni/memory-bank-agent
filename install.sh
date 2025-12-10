#!/bin/bash
TARGET_DIR=$1
if [ -z "$TARGET_DIR" ]; then
  echo "Usage: ./install.sh /path/to/project"
  exit 1
fi
cp -r .cursor/ "$TARGET_DIR/.cursor/"
cp -r memory-bank/ "$TARGET_DIR/memory-bank/"
echo "Memory-bank setup complete in $TARGET_DIR!"