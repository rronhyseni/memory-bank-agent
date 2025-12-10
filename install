#!/bin/bash
# 🚀 Memory Bank Agent Installer v3
# Run from ANY project directory: ~/memory-bank-agent/install [--cursor|--cloud|--all]
# Copies .cursor/ and/or .cloud/ folders + initializes memory-bank/

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Get the script's directory (where memory-bank-agent is installed)
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Target is current working directory
TARGET_DIR="$(pwd)"

# Default: install .cursor only
INSTALL_CURSOR=true
INSTALL_CLOUD=false

# Parse arguments
if [ "$1" = "--cloud" ]; then
  INSTALL_CURSOR=false
  INSTALL_CLOUD=true
elif [ "$1" = "--all" ]; then
  INSTALL_CURSOR=true
  INSTALL_CLOUD=true
elif [ "$1" = "--cursor" ] || [ -z "$1" ]; then
  INSTALL_CURSOR=true
  INSTALL_CLOUD=false
else
  echo "Usage: ~/memory-bank-agent/install [--cursor|--cloud|--all]"
  echo ""
  echo "Options:"
  echo "  --cursor  Copy .cursor/ folder only (default)"
  echo "  --cloud   Copy .cloud/ folder only"
  echo "  --all     Copy both .cursor/ and .cloud/ folders"
  exit 1
fi

echo -e "${BLUE}🚀 Memory Bank Agent Installer${NC}"
echo -e "   Source: ${SCRIPT_DIR}"
echo -e "   Target: ${TARGET_DIR}"
echo ""

# Check if we're in the memory-bank-agent directory itself
if [ "$TARGET_DIR" = "$SCRIPT_DIR" ]; then
  echo -e "${YELLOW}⚠️  You're running install from the memory-bank-agent directory itself!${NC}"
  echo "   Please run this from your project directory:"
  echo "   cd /path/to/your/project"
  echo "   ~/memory-bank-agent/install"
  exit 1
fi

# Install .cursor/
if [ "$INSTALL_CURSOR" = true ]; then
  echo -e "${GREEN}📁 Installing .cursor/ folder...${NC}"
  if [ -d "$TARGET_DIR/.cursor" ]; then
    echo "   ⚠️  .cursor/ already exists, merging safely..."
    
    # Copy commands if they don't exist
    if [ -d "$SCRIPT_DIR/.cursor/commands" ]; then
      mkdir -p "$TARGET_DIR/.cursor/commands"
      cp -rn "$SCRIPT_DIR/.cursor/commands/"* "$TARGET_DIR/.cursor/commands/" 2>/dev/null || true
      echo "   ✅ Commands merged"
    fi
    
    # Copy rules if they don't exist
    if [ -d "$SCRIPT_DIR/.cursor/rules" ]; then
      mkdir -p "$TARGET_DIR/.cursor/rules"
      cp -n "$SCRIPT_DIR/.cursor/rules/"* "$TARGET_DIR/.cursor/rules/" 2>/dev/null || true
      echo "   ✅ Rules merged"
    fi
  else
    cp -r "$SCRIPT_DIR/.cursor" "$TARGET_DIR/"
    echo "   ✅ .cursor/ copied"
  fi
fi

# Install .cloud/
if [ "$INSTALL_CLOUD" = true ]; then
  echo -e "${GREEN}☁️  Installing .cloud/ folder...${NC}"
  if [ -d "$SCRIPT_DIR/.cloud" ]; then
    if [ -d "$TARGET_DIR/.cloud" ]; then
      echo "   ⚠️  .cloud/ already exists, merging safely..."
      cp -rn "$SCRIPT_DIR/.cloud/"* "$TARGET_DIR/.cloud/" 2>/dev/null || true
      echo "   ✅ .cloud/ merged"
    else
      cp -r "$SCRIPT_DIR/.cloud" "$TARGET_DIR/"
      echo "   ✅ .cloud/ copied"
    fi
  else
    echo "   ⚠️  No .cloud/ folder found in memory-bank-agent"
  fi
fi

# Initialize memory-bank/
echo -e "${GREEN}📝 Initializing memory-bank/...${NC}"
MEMORY_BANK_DIR="$TARGET_DIR/memory-bank"

if [ ! -d "$MEMORY_BANK_DIR" ]; then
  mkdir -p "$MEMORY_BANK_DIR"
  echo "   ✅ Created memory-bank/"
fi

# Create stub files if they don't exist
STUBS=("project-brief.md" "product-context.md" "system-patterns.md" "tech-context.md" "active-context.md")
for stub in "${STUBS[@]}"; do
  if [ ! -f "$MEMORY_BANK_DIR/$stub" ]; then
    echo "# ${stub%.md}" > "$MEMORY_BANK_DIR/$stub"
    echo "" >> "$MEMORY_BANK_DIR/$stub"
    echo "<!-- This file will be populated by running the /init command in Cursor -->" >> "$MEMORY_BANK_DIR/$stub"
  fi
done

echo ""
echo -e "${GREEN}🎉 Installation Complete!${NC}"
echo ""
echo "Next steps:"
echo "1. Restart Cursor (Cmd/Ctrl + Shift + P > 'Developer: Reload Window')"
echo "2. Run: /init"
echo "3. Run: /include"
echo "4. Generate docs: /shape-project-brief, /shape-system-patterns, etc."
echo ""
echo -e "${BLUE}Happy coding! 🚀${NC}"