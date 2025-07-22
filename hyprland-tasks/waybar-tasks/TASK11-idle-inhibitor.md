# Idle Inhibitor (`idle_inhibitor`)

## Description
Toggle idle management to prevent automatic screen lock, sleep, and brightness reduction

## Position
Right

## Documentation
[Idle Inhibitor Module](https://github.com/Alexays/Waybar/wiki/Module:-Idle-Inhibitor)

## Configuration
- **Format Variants**:
  - **Idle Inhibited (disabled)**: `"󰅶 Inhibited"` - idle management disabled, system stays active
  - **Idle Allowed (enabled)**: `"󰾪 Auto-idle"` - idle management enabled, system can sleep/lock
- **Icons**:
  - **Inhibited**: 󰅶 (eye open - system staying awake)
  - **Enabled**: 󰾪 (sleep/moon icon - idle allowed)
- **Click Action**: Toggle idle inhibitor state
  - **When inhibited**: Click to allow idle management (hypridle can lock/sleep/dim)
  - **When enabled**: Click to inhibit idle management (prevents hypridle actions)
- **Hover Information**:
  - **Inhibited**: `"Idle management disabled - system will not auto-lock or sleep"`
  - **Enabled**: `"Idle management enabled - system will auto-lock and sleep as configured"`
- **Hypridle Integration**:
  - Works with hypridle daemon running in background
  - When inhibited: prevents hypridle from executing any idle actions
  - When enabled: allows hypridle to manage screen brightness, locking, suspend, etc.
  - No hypridle configuration needed - works with existing hypridle setup
