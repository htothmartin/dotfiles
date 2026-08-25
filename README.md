# 🌿 Dotfiles

Personal dotfiles managed cleanly with **[GNU Stow](https://www.gnu.org/software/stow/)**. Configured for a sleek, efficient, and minimal tiling desktop environment powered by **i3wm**, **Polybar**, **Kitty**, **Picom**, and **Rofi**.

---

## 📸 Desktop Stack & Features

* **Window Manager:** [i3-wm](https://i3wm.org/) / i3-gaps (Gruvbox-accented window borders & workspaces)
* **Status Bar:** [Polybar](https://github.com/polybar/polybar) (Clean status bar with workspace switcher, systray, clock, storage)
* **Terminal:** [Kitty](https://sw.kovidgoyal.net/kitty/) (Gruvbox Dark Hard theme with JetBrains Mono Nerd Font)
* **Compositor:** [Picom](https://github.com/yshui/picom) (Smooth transitions and subtle transparency)
* **Application Launcher:** [Rofi](https://github.com/davatorium/rofi) (Material & Nordic themed launcher)
* **Wallpaper Manager:** [feh](https://feh.finalrewind.org/) with multi-wallpaper randomizer
* **Audio & Power:** PipeWire (`pipewire-pulse`) audio management with `pavucontrol`, `pasystray`, and `cbatticon` tray applets

---

## 📂 Repository Structure

GNU Stow creates symlinks from each directory in this repository to their target locations inside your `$HOME` directory:

```text
dotfiles/
├── i3/
│   └── .config/i3/                -> ~/.config/i3/
│       ├── config
│       └── keyboardlang.sh
├── kitty/
│   └── .config/kitty/             -> ~/.config/kitty/
│       ├── kitty.conf
│       └── current-theme.conf
├── picom/
│   └── .config/picom/             -> ~/.config/picom/
│       └── picom.conf
├── polybar/
│   └── .config/polybar/           -> ~/.config/polybar/
│       ├── config.ini
│       └── launch.sh
├── rofi/
│   ├── .config/rofi/              -> ~/.config/rofi/
│   │   └── config.rasi
│   └── .local/share/rofi/themes/  -> ~/.local/share/rofi/themes/
├── scripts/
│   └── random_wallpaper.sh
└── wallpapers/
    └── [Anime & Landscape collection]
```

---

## 🛠️ Prerequisites & Dependencies

Before applying the dotfiles, install the required packages and fonts for your Linux distribution.

### 1. Arch Linux / Manjaro

```bash
# Core window manager, tools & utilities
sudo pacman -S --needed \
    stow \
    i3-wm \
    polybar \
    rofi \
    kitty \
    picom \
    feh \
    brightnessctl \
    numlockx \
    dex \
    xss-lock \
    i3lock \
    network-manager-applet \
    pipewire \
    pipewire-pulse \
    pipewire-alsa \
    wireplumber \
    pavucontrol \
    pasystray \
    cbatticon

# Required Fonts (Nerd Fonts & Font Awesome for icons)
sudo pacman -S --needed \
    ttf-jetbrains-mono-nerd \
    ttf-font-awesome
```

### 2. Debian / Ubuntu

```bash
sudo apt update
sudo apt install -y \
    stow \
    i3 \
    polybar \
    rofi \
    kitty \
    picom \
    feh \
    brightnessctl \
    numlockx \
    dex \
    xss-lock \
    i3lock \
    network-manager-gnome \
    fonts-font-awesome \
    fonts-jetbrains-mono \
    pipewire \
    pipewire-pulse \
    wireplumber \
    pavucontrol \
    pasystray \
    cbatticon
```

### 3. Fedora

```bash
sudo dnf install -y \
    stow \
    i3 \
    polybar \
    rofi \
    kitty \
    picom \
    feh \
    brightnessctl \
    numlockx \
    dex \
    xss-lock \
    i3lock \
    NetworkManager-applet \
    fontawesome-fonts-all \
    jetbrains-mono-fonts-all \
    pipewire \
    pipewire-pulseaudio \
    wireplumber \
    pavucontrol \
    pasystray \
    cbatticon
```

---

## 🚀 Installation Guide (GNU Stow)

### 1. Clone the Repository

Clone this repository directly into your home folder at `~/dotfiles`:

```bash
git clone https://github.com/htothmartin/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

> **Important:** The i3 config and wallpaper script look for wallpapers in `~/dotfiles/wallpapers/`. Keeping the repository at `~/dotfiles` ensures everything works out of the box.

### 2. Ensure Scripts are Executable

```bash
chmod +x polybar/.config/polybar/launch.sh \
         i3/.config/i3/keyboardlang.sh \
         scripts/random_wallpaper.sh
```

### 3. Backup Existing Configurations (Optional but Recommended)

If you already have existing configuration files in `~/.config/`, move or back them up to avoid symlink conflicts:

```bash
mkdir -p ~/.config-backup
mv ~/.config/i3 ~/.config/kitty ~/.config/picom ~/.config/polybar ~/.config/rofi ~/.config-backup/ 2>/dev/null || true
```

### 4. Deploy Dotfiles with Stow

From within the `~/dotfiles` directory:

```bash
# Stow all configuration modules
stow i3 kitty picom polybar rofi
```

Or stow individual modules as needed:
```bash
stow i3       # Links ~/.config/i3/
stow kitty    # Links ~/.config/kitty/
stow picom    # Links ~/.config/picom/
stow polybar  # Links ~/.config/polybar/
stow rofi     # Links ~/.config/rofi/ and ~/.local/share/rofi/themes/
```

> **Tip:** If Stow complains about existing files, you can use the `--adopt` flag to adopt existing files into the repo or overwrite target symlinks with `stow --restow <module>`.

---

## ⌨️ Keybindings Cheat Sheet

The default modifier key is **`Mod4`** (`Super` / `Windows Key`).

### Core Applications
| Keybinding | Action |
|---|---|
| `Super + Return` | Open Terminal (`kitty` / default sensible terminal) |
| `Super + d` | Open Application Launcher (`rofi`) |
| `Super + Shift + q` | Close / Kill focused window |
| `Super + Shift + w` | Change to a random wallpaper (`feh`) |

### Window Management & Layouts
| Keybinding | Action |
|---|---|
| `Super + h` / `Super + v` | Split window horizontally / vertically |
| `Super + f` | Toggle Fullscreen |
| `Super + Shift + Space` | Toggle Floating / Tiling mode |
| `Super + Space` | Switch focus between floating and tiled windows |
| `Super + s` / `w` / `e` | Stacking / Tabbed / Default layout |
| `Super + r` | Enter **Resize Mode** (use `H/J/K/L` or Arrow keys; `Esc` / `Enter` to exit) |

### Navigation & Workspaces
| Keybinding | Action |
|---|---|
| `Super + j/k/l/;` or `Arrows` | Move focus (Left / Down / Up / Right) |
| `Super + Shift + j/k/l/;` | Move window (Left / Down / Up / Right) |
| `Super + 1-9, 0` | Switch to workspace 1–10 |
| `Super + Shift + 1-9, 0` | Move focused window to workspace 1–10 |

### System & Session
| Keybinding | Action |
|---|---|
| `Super + Shift + c` | Reload i3 configuration |
| `Super + Shift + r` | Restart i3 in-place |
| `Super + Shift + e` | Exit / Logout of i3 session |
| `Volume Up / Down / Mute` | Adjust system volume via PulseAudio |
| `Brightness Up / Down` | Adjust display brightness via `brightnessctl` |

---

## 🔧 Post-Installation & Customization

* **Keyboard Layout:**
  Check [i3/.config/i3/keyboardlang.sh](file:///home/martin/dotfiles/i3/.config/i3/keyboardlang.sh) if you want to customize your keyboard layout or host-specific rules.
* **Adding Wallpapers:**
  Place any `.png` or `.jpg` image inside `~/dotfiles/wallpapers/`. They will automatically be included in the startup and `Super + Shift + w` randomizer.
* **Changing Rofi Theme:**
  Themes are located in `~/.local/share/rofi/themes/`. Edit `~/.config/rofi/config.rasi` to switch themes (e.g., `squared-material-red`, `squared-nord`, `simple-tokyonight`).

---

## 🗑️ How to Unstow / Uninstall

To safely remove the symlinks without deleting your repository files:

```bash
cd ~/dotfiles
stow -D i3 kitty picom polybar rofi
```
