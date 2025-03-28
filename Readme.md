# sticky-paper 📝

## Rofi – Minimalist Note-Taking with Rofi

![Rofi Notes Screenshot](./Preview/preview.png)

## 🎯 Features

✅ **Enter** → Copy a note & add if new
✅ **Ctrl+X** → Copy & delete note
✅ **Custom Rofi theme & fonts**
✅ **Minimal dependencies** – Rofi & `wl-clipboard`

## ⚙ Installation

```bash
git clone https://github.com/yourusername/rofi-notes.git
cd rofi-notes
chmod +x install.sh && ./install.sh
```

Run with

```
$ sticky-paper
```

### Nix

##### Quick Run without installation
```bash
nix run github:ashish-kus/sticky-paper
```

##### Installation
```bash
# Add the flake in your flake.nix inputs
inputs = {
    sticky-paper.url = "github:ashish-kus/sticky-paper";
};

# Add sticky-paper to your systemPackages
environment.systemPackages = [
    inputs.sticky-paper.packages.${pkgs.system}.default
];
```

Hyprland Keybind:

```
bind = Ctrl,Space, exec, killall rofi || <PATH/TO/SCRIPT>/sticky-paper
```

🎨 Customization

    Theme: ~/.config/rofi/theme/notes.rasi
    Fonts: ~/.local/share/fonts/
    Images: ~/.config/rofi/images/

Note: Requires Rofi, wl-clipboard (Wayland), bash
