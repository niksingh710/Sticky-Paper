#!/bin/bash

# Define locations
INSTALL_DIR="$HOME/.local/bin"
THEME_DIR="$HOME/.config/rofi/theme"
IMAGE_DIR="$HOME/.config/rofi/images"
FONT_DIR="$HOME/.local/share/fonts"

# Repo locations
SCRIPT_NAME="sticky-paper"
SCRIPT_SRC="./$SCRIPT_NAME"
THEME_SRC="./themes/"
IMAGE_SRC="./Images/"
FONT_SRC="./fonts/"

# Ensure required directories exist
mkdir -p "$INSTALL_DIR" "$THEME_DIR" "$IMAGE_DIR" "$FONT_DIR"

# Install script
echo "📂 Installing script..."
cp "$SCRIPT_SRC" "$INSTALL_DIR/$SCRIPT_NAME"
chmod +x "$INSTALL_DIR/$SCRIPT_NAME"

# Install theme
echo "🎨 Installing Rofi theme..."
cp -r "$THEME_SRC"/* "$THEME_DIR/"

# Install images
echo "🖼 Installing images..."
cp -r "$IMAGE_SRC"/* "$IMAGE_DIR/"

# Install fonts
echo "🔤 Installing fonts..."
cp -r "$FONT_SRC"/*.ttf "$FONT_DIR/"
fc-cache -f # Refresh font cache

# Create .desktop entry (Optional)
DESKTOP_ENTRY="$HOME/.local/share/applications/rofi-notes.desktop"
cat >"$DESKTOP_ENTRY" <<EOF
[Desktop Entry]
Name=Rofi Notes
Exec=$INSTALL_DIR/$SCRIPT_NAME
Type=Application
Categories=Utility;
Terminal=false
EOF
chmod +x "$DESKTOP_ENTRY"

# Completion message
echo "✅ Installation complete!"
echo "📂 Script installed at: $INSTALL_DIR/$SCRIPT_NAME"
echo "🎨 Theme installed at: $THEME_DIR/"
echo "🖼 Images installed at: $IMAGE_DIR/"
echo "🔤 Fonts installed at: $FONT_DIR/"
echo "🚀 Run using: rofi-notes"

# Restart Rofi for changes to take effect
pkill -USR1 rofi 2>/dev/null
