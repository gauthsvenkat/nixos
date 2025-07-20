# Hyprland Setup Refinement

This document tracks the project to refine the Hyprland setup on NixOS. We will use a Jira-like format to manage tasks.

## Bugs

### BUG-1: Network connectivity issues when launching Hyprland from SDDM

**Description:** When launching Hyprland from the SDDM login screen, network services (like Wi-Fi) do not connect automatically. This requires manual intervention. The setup should ensure all necessary user services are started correctly, regardless of the desktop session chosen.

**Status:** TODO

**Description:** This likely relates to how user session services are started. We need to investigate how the Hyprland session is initiated and ensure it's compatible with services managed by `systemd --user` or similar, which KDE might handle differently. The issue could be that the KDE keyring is not being unlocked on login to a non-KDE session, which would prevent NetworkManager from accessing saved Wi-Fi passwords. This is a common issue when mixing desktop environments.

---

## Tasks

- [ ] **Task 1: Refactor and Prune Existing Hyprland Configuration.**
  - **Description:** Before defining new requirements, we should refactor the existing `components/gui/hyprland/` files. The goal is to create a clean, minimal, and well-organized foundation.
  - **Actions:**
    - **Analyze:** Review `hyprland.nix`, `hypridle.nix`, `hyprlock.nix`, `tofi.nix`, and `waybar.nix`.
    - **Prune:** Remove complex or theme-related settings that will be handled later by `stylix` or more detailed component configurations (e.g., advanced `hyprlock` styling, `waybar` widgets).
    - **Organize:** Decide on a sensible file structure. The `waybar` configuration should be split into smaller, composable files. Each module (e.g., `cpu`, `memory`, `clock`) could be its own file, which can then be selectively imported in the `bases` layer to build the final `waybar.settings`.
  - **Goal:** The result should be a set of simple, functional NixOS modules for the core Hyprland components with default, un-themed settings.
- [ ] **Task 3: Implement Waybar.**
  - **Description:**
  - **Suggestions:** `waybar`
  - **Functional Requirements:**
    - Display workspaces (`hyprland/workspaces`).
    - Show a system tray (`tray`).
    - Show essential hardware info (`cpu`, `memory`).
    - Control volume (`wireplumber`) and backlight (`backlight`).
    - Show network status (`network`).
    - Show a clock (`clock`).
  - **Nice-to-haves:**
    - A start button to launch the application launcher.
    - Media player controls (`mpris`).
    - A custom VPN status module.
    - Interactive modules:
      - Click `wireplumber` to open `pavucontrol`.
      - Click `network` to open a network manager GUI.
      - Click `clock` to show a calendar.
  - **Architecture:**
    - Waybar modules should be defined in separate files and composed at the `bases` layer to allow for per-host configuration (e.g., only including `battery` and `backlight` on laptops).
- [ ] **Task 4: Implement Application Launcher.**
  - **Description:** `tofi` is too simple for the desired "spotlight-like" functionality. `rofi` is highly extensible and supports custom scripts, making it a better fit. We will need a Wayland-compatible fork.
  - **Suggestions:** `rofi` (Wayland fork)
  - **Functional Requirements:**
    - Launch desktop applications (`drun` mode).
  - **Nice-to-haves:**
    - A mode for quick calculations.
    - A mode for web searches.
  - **Architecture:**
    - We will need to package a Wayland-compatible `rofi` fork.
    - The configuration will involve setting up the different modes (`drun`, and custom scripts for calc/web) and combining them using `rofi`'s combi mode.
- [ ] **Task 5: Implement Notification Daemon.**
  - **Description:** Key considerations when choosing a notification daemon include:
  - **Suggestions:** `dunst`, `mako`.
  - **Functional Requirements:**
    - Display notifications.
  - **Nice-to-haves:**
    - Notification history (`dunst` has this).
    - Interactive notification actions/buttons (`dunst` has this).
    - Rules for filtering/modifying notifications (`dunst` has this).
  - `mako` is another popular, lightweight daemon for Wayland. It is more minimal than `dunst`.
- [ ] **Task 6: Implement Screen Locker.**
  - **Description:** We will configure the screen locker to be similar to the KDE lock screen.
  - **Suggestions:** `hyprlock`
  - **Functional Requirements:**
    - Show the current date and time.
    - Show the current username.
    - Provide a password input field.
  - **Nice-to-haves:**
    - A "reveal password" toggle.
    - On-screen media controls (play/pause, next, prev).
    - On-screen session controls (shutdown, restart, sleep).
  - **Architecture:**
    - This will require configuring multiple `label` and `input-field` elements in `hyprlock`.
    - We need to verify if `hyprlock` supports interactive buttons for media/session controls. If not, we may need to find an alternative or a workaround.
- [ ] **Task 7: Implement Idle Daemon.**
  - **Description:**
  - **Suggestions:** `hypridle`
  - **Functional Requirements:**
    - After a timeout, lock the screen.
    - After a longer timeout, turn off the display.
  - **Nice-to-haves:**
    - After an even longer timeout, put the system to sleep.
    - Reduce screen brightness as part of the idle sequence.
    - A "caffeine mode" toggle to temporarily inhibit idle actions, accessible from `waybar` and the lock screen.
  - **Architecture:**
    - The sleep inhibition will likely require a script that creates/removes a lock file (e.g., `/tmp/caffeine.lock`).
    - The `hypridle` configuration for the sleep action will need to be conditional, checking for the existence of this lock file before running `systemctl suspend`.
    - `waybar` will need a `custom` module to call the toggle script and display the current state (e.g., with different icons).
    - `hyprlock` will need an interactive button, which again raises the question of its capabilities (see `Task 6`).
- [ ] **Task 8: Implement Screenshot Tool.**
  - **Description:** The user wants a Spectacle-like experience with built-in annotation capabilities. More exploration is needed to select the best tool.
  - **Functional Requirements:**
    - Capture the entire screen, a specific output, the active window, or a user-selected region.
    - Save the screenshot to a file or copy it to the clipboard.
  - **Nice-to-haves:**
    - A GUI to annotate the screenshot after capture.
  - **Suggestions:**
    - `flameshot`: All-in-one tool with a GUI.
    - `ksnip`: Another all-in-one tool, similar to Spectacle.
    - `hyprshot`: A tool specifically for Hyprland.
    - `grim` + `slurp` + `swappy`: A modular, scriptable approach (capture + select + annotate).
- [ ] **Task 9: Implement Wallpaper Handling.**
  - **Description:** The primary requirement is to display a wallpaper.
  - **Suggestions:** `hyprpaper` + `stylix`
  - **Functional Requirements:**
    - Set a static wallpaper on startup.
  - **Nice-to-haves:**
    - N/A
  - **Architecture:**
    - `stylix` will be used to manage the wallpaper image. It can take a path to an image (either inside the repo or on the local filesystem) and make it available in the Nix store.
    - The `hyprpaper` configuration will then be simplified to just point to the wallpaper path provided by `stylix`.
    - This approach makes wallpaper management declarative and resolves the core question of `Task 11`. The user can choose to commit wallpapers to the repo or not, and the Nix configuration will handle it correctly.
- [ ] **Task 10: Implement Clipboard Manager.**
  - **Description:** The user wants a KDE-like clipboard experience. `cliphist` is a great choice for this on Wayland, especially when paired with a menu like `rofi`.
  - **Suggestions:** `cliphist`
  - **Functional Requirements:**
    - Store a history of copied items (text and images).
    - Provide a way to view the history and select an item to paste.
  - **Nice-to-haves:**
    - A `waybar` module that opens the history viewer on click.
  - **Architecture:**
    - Add the `cliphist` package.
    - The clipboard history viewer will be implemented by integrating `cliphist` with `rofi` (our chosen launcher from `Task 4`).
    - A `custom` module will be added to `waybar` to display an icon and launch the `rofi`-based history viewer on click.
- [ ] **Task 11: Implement Wallpaper Management Strategy.**
  - **Description:** We need to decide how to manage wallpapers for `hyprpaper` and `stylix`.
  - **Functional Requirements:**
    - The system must have a declarative way to specify the wallpaper path.
  - **Nice-to-haves:**
    - The wallpaper image files could be stored directly in the Nix configuration repository for full reproducibility.
- [ ] **Task 12: Implement a Blue Light Filter.**
  - **Description:** A blue light filter is important for eye comfort.
  - **Suggestions:** `hyprsunset`
  - **Functional Requirements:**
    - Automatically adjust screen color temperature based on the time of day.
  - **Nice-to-haves:**
    - A manual toggle to enable/disable the filter, accessible from `waybar`.
  - **Architecture:**
    - Add the `hyprsunset` package.
    - Configure `hyprsunset` to run as a service, likely using the user's location (latitude/longitude) to determine sunrise and sunset times for the schedule.
    - For the toggle, a `custom` module will be added to `waybar`. This module will display the current status (on/off) and, when clicked, will execute a script to start or stop the `hyprsunset` service/process.
