# 🚀 Memory Bank Agent Installer v3 (PowerShell)
# Run from ANY project directory: ~/memory-bank-agent/install.ps1 [--cursor|--claude|--all]
# Copies .cursor/ and/or .claude/ folders + CLAUDE.md (for Claude Code)

$ErrorActionPreference = "Stop"

# Colors for output
function Write-ColorOutput {
    param(
        [string]$Message,
        [string]$Color = "White"
    )
    Write-Host $Message -ForegroundColor $Color
}

# Get the script's directory (where memory-bank-agent is installed)
$SCRIPT_DIR = Split-Path -Parent $MyInvocation.MyCommand.Path

# Target is current working directory
$TARGET_DIR = Get-Location

# Default: install .cursor only
$INSTALL_CURSOR = $true
$INSTALL_CLAUDE = $false

# Parse arguments
if ($args.Count -gt 0) {
    if ($args[0] -eq "--claude") {
        $INSTALL_CURSOR = $false
        $INSTALL_CLAUDE = $true
    }
    elseif ($args[0] -eq "--all") {
        $INSTALL_CURSOR = $true
        $INSTALL_CLAUDE = $true
    }
    elseif ($args[0] -eq "--cursor") {
        $INSTALL_CURSOR = $true
        $INSTALL_CLAUDE = $false
    }
    else {
        Write-ColorOutput "Usage: ~/memory-bank-agent/install.ps1 [--cursor|--claude|--all]" "Yellow"
        Write-Host ""
        Write-Host "Options:"
        Write-Host "  --cursor  Copy .cursor/ folder only (default)"
        Write-Host "  --claude  Copy .claude/ folder only"
        Write-Host "  --all     Copy both .cursor/ and .claude/ folders"
        exit 1
    }
}

Write-ColorOutput "🚀 Memory Bank Agent Installer" "Cyan"
Write-ColorOutput "   Source: $SCRIPT_DIR" "Cyan"
Write-ColorOutput "   Target: $TARGET_DIR" "Cyan"
Write-Host ""

# Check if we're in the memory-bank-agent directory itself
if ($TARGET_DIR -eq $SCRIPT_DIR) {
    Write-ColorOutput "⚠️  You're running install from the memory-bank-agent directory itself!" "Yellow"
    Write-Host "   Please run this from your project directory:"
    Write-Host "   cd C:\path\to\your\project"
    Write-Host "   ~\memory-bank-agent\install.ps1"
    exit 1
}

# Function to safely copy directory contents (merge without overwriting)
function Copy-DirectorySafely {
    param(
        [string]$Source,
        [string]$Destination
    )
    
    if (-not (Test-Path $Source)) {
        return
    }
    
    if (-not (Test-Path $Destination)) {
        New-Item -ItemType Directory -Path $Destination -Force | Out-Null
    }
    
    Get-ChildItem -Path $Source -Recurse | ForEach-Object {
        $relativePath = $_.FullName.Substring($Source.Length + 1)
        $destPath = Join-Path $Destination $relativePath
        
        if ($_.PSIsContainer) {
            if (-not (Test-Path $destPath)) {
                New-Item -ItemType Directory -Path $destPath -Force | Out-Null
            }
        }
        else {
            if (-not (Test-Path $destPath)) {
                Copy-Item $_.FullName -Destination $destPath -Force
            }
        }
    }
}

# Install .cursor/
if ($INSTALL_CURSOR) {
    Write-ColorOutput "📁 Installing .cursor/ folder..." "Green"
    $cursorTarget = Join-Path $TARGET_DIR ".cursor"
    
    if (Test-Path $cursorTarget) {
        Write-Host "   ⚠️  .cursor/ already exists, merging safely..."
        
        # Copy commands if they don't exist
        $commandsSource = Join-Path $SCRIPT_DIR ".cursor\commands"
        $commandsTarget = Join-Path $cursorTarget "commands"
        if (Test-Path $commandsSource) {
            Copy-DirectorySafely -Source $commandsSource -Destination $commandsTarget
            Write-Host "   ✅ Commands merged"
        }
        
        # Copy rules if they don't exist
        $rulesSource = Join-Path $SCRIPT_DIR ".cursor\rules"
        $rulesTarget = Join-Path $cursorTarget "rules"
        if (Test-Path $rulesSource) {
            Copy-DirectorySafely -Source $rulesSource -Destination $rulesTarget
            Write-Host "   ✅ Rules merged"
        }
        
        # Copy templates if they don't exist
        $templatesSource = Join-Path $SCRIPT_DIR ".cursor\templates"
        $templatesTarget = Join-Path $cursorTarget "templates"
        if (Test-Path $templatesSource) {
            Copy-DirectorySafely -Source $templatesSource -Destination $templatesTarget
            Write-Host "   ✅ Templates merged"
        }
    }
    else {
        Copy-Item -Path (Join-Path $SCRIPT_DIR ".cursor") -Destination $cursorTarget -Recurse -Force
        Write-Host "   ✅ .cursor/ copied"
    }
}

# Install .claude/ and CLAUDE.md
if ($INSTALL_CLAUDE) {
    Write-ColorOutput "☁️  Installing .claude/ folder..." "Green"
    $claudeSource = Join-Path $SCRIPT_DIR ".claude"
    
    if (Test-Path $claudeSource) {
        $claudeTarget = Join-Path $TARGET_DIR ".claude"
        
        if (Test-Path $claudeTarget) {
            Write-Host "   ⚠️  .claude/ already exists, merging safely..."
            $commandsSource = Join-Path $claudeSource "commands"
            $commandsTarget = Join-Path $claudeTarget "commands"
            if (Test-Path $commandsSource) {
                Copy-DirectorySafely -Source $commandsSource -Destination $commandsTarget
                Write-Host "   ✅ Commands merged"
            }
        }
        else {
            Copy-Item -Path $claudeSource -Destination $claudeTarget -Recurse -Force
            Write-Host "   ✅ .claude/ copied"
        }
    }
    else {
        Write-Host "   ⚠️  No .claude/ folder found in memory-bank-agent"
    }
    
    # Copy CLAUDE.md (required for Claude Code to load project context)
    Write-ColorOutput "📄 Installing CLAUDE.md..." "Green"
    $claudeMdSource = Join-Path $SCRIPT_DIR "CLAUDE.md"
    $claudeMdTarget = Join-Path $TARGET_DIR "CLAUDE.md"
    
    if (Test-Path $claudeMdSource) {
        if (Test-Path $claudeMdTarget) {
            Write-Host "   ⚠️  CLAUDE.md already exists, skipping (to preserve your customizations)"
            Write-Host "   💡 If you want to update it, manually copy from: $claudeMdSource"
        }
        else {
            Copy-Item -Path $claudeMdSource -Destination $claudeMdTarget -Force
            Write-Host "   ✅ CLAUDE.md copied"
        }
    }
    else {
        Write-Host "   ⚠️  No CLAUDE.md found in memory-bank-agent"
    }
}

Write-Host ""
Write-ColorOutput "🎉 Installation Complete!" "Green"
Write-Host ""

if ($INSTALL_CURSOR) {
    Write-Host "Next steps for Cursor:"
    Write-Host "1. Restart Cursor (Cmd/Ctrl + Shift + P > 'Developer: Reload Window')"
    Write-Host "2. Run: mb/init (this command is used to initialize the memory bank system)"
    Write-Host "3. Run: mb/include (this command is used to ACTIVATE the memory bank system on sessions you see fit)"
    Write-Host "4. Generate docs: mb/shape-project-brief, mb/shape-system-patterns, etc."
}

if ($INSTALL_CLAUDE) {
    Write-Host "Next steps for Claude Code:"
    Write-Host "1. Restart Claude Code (or open this project)"
    Write-Host "2. CLAUDE.md is now in your project root - Claude will automatically load it"
    Write-Host "3. Run: mb/init (this command is used to initialize the memory bank system)"
    Write-Host "4. Run: mb/include (this command is used to ACTIVATE the memory bank system on sessions you see fit)"
    Write-Host "5. Generate docs: mb/shape-project-brief, mb/shape-system-patterns, etc."
}

Write-Host ""
Write-ColorOutput "Happy coding! 🚀" "Cyan"
