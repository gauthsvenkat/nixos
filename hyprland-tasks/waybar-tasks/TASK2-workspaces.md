# Workspaces (`hyprland/workspaces`)

## Description
Dynamic Hyprland workspaces with app icons and visual state indicators

## Position
Center

## Documentation
[Hyprland Module](https://github.com/Alexays/Waybar/wiki/Module:-Hyprland#workspaces)

## Configuration
- **Dynamic Behavior**: Only shows created workspaces, disappears when empty and user leaves
- **Multi-Monitor**: All monitors show all workspaces (global workspace view)
- **Visual States**:
  - **Active**: Currently focused workspace (distinct styling)
  - **Inactive**: Other workspaces with content
  - **Urgent**: Workspaces requesting attention
- **App Icons**: Shows icons of applications open in each workspace
- **Format**: `"{name}: {windows}"` - workspace name with app icons
- **Window Separator**: Space separator between app icons
- **Hover**: Workspace name and window count details
- **Click**: Switch to workspace
- **Scroll**: Navigate through workspaces
- **Configuration Options**:
  - `active-only`: false (show all workspaces, not just active)
  - `all-outputs`: true (show workspaces from all monitors)
  - `on-click`: "activate" (switch to workspace on click)
  - `disable-scroll`: false (allow scroll navigation)
  - `sort-by`: "number" (sort workspaces numerically)
- **Window Rewrite Rules**: Map application classes to nerd font icons
  - `wezterm`: 󰆍 (terminal icon)
  - `dolphin`: 󰝰 (file manager icon)
  - `firefox`: 󰈹 (browser icon)
  - `spotify`: 󰓇 (music icon)
  - `jellyfin`: 󰚺 (media icon)
  - `steam`: 󰓓 (gaming icon)
  - **Default**: 󰍹 (window icon for unmatched apps)
- **Special Workspaces**: Ignored for now (to be configured later)
