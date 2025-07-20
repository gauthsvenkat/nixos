# Task 9: Implement Wallpaper Handling

**Description:**
Establish declarative wallpaper management system.

**Suggestions:**
- `hyprpaper`

**Functional Requirements:**
- Set static wallpaper on startup

**Steps:**
- Add a new component: `components/wallpapers`.
- In `default.nix`, use home-manager to copy the wallpapers to `~/Pictures/wallpapers/`
- Update `bases/workstation.nix` to import above component.
- Add a wallpaper option to `components/config.nix`. The option should be a string (name of the wallpaper, relative to `~/Pictures/wallpapers/`).
- Add a new component `components/hypr/hyprpaper.nix`. Enable the home-manager version of hyprpaper and configure it to use `hostCfg.wallpaper` option to set the wallpaper path.
- Add `*.jpg` and `*.png` to git lfs.
- Move wallpapers from current location to this new location.
