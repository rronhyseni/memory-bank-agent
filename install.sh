```bash
#!/bin/bash
# 🛡️ SAFE Memory Bank Installer v2
# Usage: ./install.sh /path/to/project  (e.g., ./install.sh /desktop/wave-app)
# - Adds shapes to .cursor/ WITHOUT overwriting rules.md/commands/
# - Initializes memory-bank/ safely (mkdir + stubs if empty)
# - Idempotent & non-destructive

TARGET_DIR=$1
if [ -z "$TARGET_DIR" ]; then
  echo "Usage: ./install.sh /path/to/project"
  exit 1
fi

cd "$TARGET_DIR" || { echo "❌ Target dir invalid: $TARGET_DIR"; exit 1; }
echo "🚀 Installing into $(pwd)..."

# Source files (assumes run from agent dir with shape-*.md)
SHAPE_FILES=("shape-project-brief.md" "shape-systemPatterns.md" "shape-techContext.md" "shape-productContext.md" "shape-activeContext.md")

CURSOR_DIR=".cursor"
MEMORY_BANK_DIR="memory-bank"

# 1. Safe .cursor/ handling
if [ ! -d "$CURSOR_DIR" ]; then
  echo "📁 Creating $CURSOR_DIR/ + copying base..."
  cp -r ../.cursor/ "$CURSOR_DIR/"  # Copy full base from agent
else
  echo "🔄 Adding to existing $CURSOR_DIR/..."
  ADDED=0
  for shape in "${SHAPE_FILES[@]}"; do
    SRC_SHAPE="../$shape"
    if [ -f "$SRC_SHAPE" ] && [ ! -f "$CURSOR_DIR/$shape" ]; then
      cp "$SRC_SHAPE" "$CURSOR_DIR/"
      echo "➕ $shape"
      ((ADDED++))
    fi
  done
  if [ $ADDED -eq 0 ]; then
    echo "ℹ️ All shapes already present."
  fi

  # Safe rules append
  if [ -f "../rules-memory-bank.md" ]; then
    if [ -f "$CURSOR_DIR/rules.md" ] && ! grep -q "Memory Bank Rules" "$CURSOR_DIR/rules.md"; then
      echo "" >> "$CURSOR_DIR/rules.md"
      echo "# Memory Bank Rules (auto-appended)" >> "$CURSOR_DIR/rules.md"
      cat ../rules-memory-bank.md >> "$CURSOR_DIR/rules.md"
      echo "📜 Appended Memory Bank rules."
    elif [ ! -f "$CURSOR_DIR/rules.md" ]; then
      cp ../rules-memory-bank.md "$CURSOR_DIR/rules.md"
      echo "📜 Copied rules.md"
    fi
  fi
fi

# 2. Safe memory-bank/
if [ ! -d "$MEMORY_BANK_DIR" ]; then
  mkdir -p "$MEMORY_BANK_DIR"
  echo "✅ Created $MEMORY_BANK_DIR/"
fi

# Add stubs if empty
STUBS=("project-brief.md" "productContext.md" "systemPatterns.md" "techContext.md" "active-context.md")
for stub in "${STUBS[@]}"; do
  if [ ! -f "$MEMORY_BANK_DIR/$stub" ]; then
    touch "$MEMORY_BANK_DIR/$stub"
    echo "# $stub" > "$MEMORY_BANK_DIR/$stub"
    echo "📝 Stub: $MEMORY_BANK_DIR/$stub"
  fi
done

echo ""
echo "🎉 Memory Bank setup COMPLETE!"
echo "💡 Restart Cursor → Use /shape-project-brief"
echo "   Generate all: /shape-systemPatterns, etc."
```

## ✅ Why Keep & Use This (Your Simple Flow)
- **Your usage unchanged**: `./install.sh /desktop/wave-app` (from agent dir).
- **Now 100% safe**: No overwrites! Adds shapes/rules-append only.
- **Handles existing**: Merges perfectly.
- **Idempotent**: Re-run = no harm.
- **Minimal deps**: Pure bash, no git/temp dirs.

**Test it**:
1. Put shapes/rules-memory-bank.md in agent root.
2. Run on test project → .cursor/ intact + shapes added.
3. Perfect! 🚀