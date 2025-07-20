# Task 1: Refactor and Prune Existing Hyprland Configuration

**Description:**
Before defining new requirements, we should refactor the existing `components/gui/hyprland/` files. The goal is to create a clean, minimal, and well-organized foundation.

**Actions:**
- **Analyze:** Review `hyprland.nix`, `hypridle.nix`, `hyprlock.nix`, `tofi.nix`, and `waybar.nix`.
- **Prune:** Remove complex or theme-related settings that will be handled later by `stylix` or more detailed component configurations (e.g., advanced `hyprlock` styling, `waybar` widgets).
- **Organize:** Decide on a sensible file structure. The `waybar` configuration should be split into smaller, composable files. Each module (e.g., `cpu`, `memory`, `clock`) could be its own file, which can then be selectively imported in the `bases` layer to build the final `waybar.settings`.

**Goal:**
The result should be a set of simple, functional NixOS modules for the core Hyprland components with default, un-themed settings.
