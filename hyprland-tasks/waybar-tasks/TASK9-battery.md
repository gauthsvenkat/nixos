# Battery (`battery`)

## Description
Display battery level, charging status, and time estimates (laptop devices only)

## Position
Right

## Documentation
[Battery Module](https://github.com/Alexays/Waybar/wiki/Module:-Battery)

## Configuration
- **Auto-Hide**: Only appears on devices with detected batteries (laptops, tablets)
- **Format Variants**:
  - **Discharging**: `"{icon} {capacity}%"` - battery icon with percentage
  - **Charging**: `"󰂄 {capacity}%"` - charging icon with percentage
  - **Full**: `"󰁹 {capacity}%"` - full battery icon
  - **Critical**: `"󰂎 {capacity}%"` - critical battery icon (red)
- **Battery Icons**: Dynamic icons based on charge level and status
  - **Discharging**: `["󰂎", "󰁺", "󰁻", "󰁼", "󰁽", "󰁾", "󰁿", "󰂀", "󰂁", "󰂂", "󰁹"]` (0-100%)
  - **Charging**: `"󰂄"` (consistent charging icon)
  - **Full**: `"󰁹"` (full battery icon)
- **Power States**:
  - **Critical**: <15% (red styling, urgent notification)
  - **Warning**: 15-30% (yellow styling)
  - **Good**: 31-80% (normal styling)
  - **Full**: >95% (green styling)
- **Update Interval**: 60 seconds (balance between accuracy and performance)
- **Time Estimates**: Shows time until full (charging) or empty (discharging)
- **Hover Information**:
  - **Discharging**: `"Battery: {capacity}% ({time} remaining)\nHealth: {health}%\nCycles: {cycles}"`
  - **Charging**: `"Charging: {capacity}% ({time} until full)\nHealth: {health}%"`
  - **Full**: `"Battery Full ({capacity}%)\nHealth: {health}%"`
- **Click Actions**:
  - **Primary Click**: Launch power management interface
    - **Option 1**: System power settings (GNOME/KDE power management)
    - **Option 2**: `power-profiles-daemon` GUI (if available)
    - **Option 3**: `tlp-ui` - TLP power management GUI
    - **Option 4**: `powertop` - Intel PowerTOP utility (`wezterm -e sudo powertop`)
- **Middle Click**: Toggle power profile (performance ↔ balanced ↔ power-saver)
- **Right Click**: Advanced power settings or battery calibration tools
- **Scroll Actions**:
  - **Scroll Up**: Switch to higher performance power profile
  - **Scroll Down**: Switch to lower power/battery saving profile
- **Power Management Integration**:
  1. **power-profiles-daemon**: Modern systemd-based power profile management
  2. **TLP**: Advanced laptop power management with extensive customization
  3. **auto-cpufreq**: Automatic CPU frequency scaling
  4. **System Settings**: Native desktop environment power management
- **Battery Health Features**:
  - Shows battery health percentage when available
  - Displays charge cycle count (Linux only)
  - Configurable charge thresholds (if supported by hardware)
- **Status-Specific Formatting**:
  - Different colors and icons for charging/discharging states
  - Critical battery warnings with visual emphasis
  - Full battery indication to prevent overcharging awareness
- **Configuration Notes**:
  - Auto-detects available batteries (/sys/class/power_supply/)
  - Supports multiple batteries (shows combined or primary)
  - Design capacity vs. actual capacity options
  - Customizable warning thresholds
  - Compatible with laptop power management tools
