# Bluetooth Status (`bluetooth`)

## Description
Display bluetooth status, connected devices, and connection management

## Position
Right

## Documentation
[Bluetooth Module](https://man.archlinux.org/man/waybar-bluetooth.5.en)

## Configuration
- **Format Variants**:
  - **Bluetooth On (no connections)**: `"󰂯 {status}"` - bluetooth icon with status text
  - **Bluetooth Connected**: `"󰂱 {device_alias}"` - connected icon with device name
  - **Bluetooth Off**: `"󰂲 Off"` - disabled bluetooth icon
  - **Bluetooth Disabled**: `"󰂲 Disabled"` - disabled bluetooth icon
  - **No Controller**: `"󰂲 No BT"` - no bluetooth hardware detected
- **Status Icons**:
  - **On/Available**: 󰂯 (bluetooth symbol)
  - **Connected**: 󰂱 (bluetooth with connection indicator)
  - **Off/Disabled**: 󰂲 (bluetooth off)
  - **Connecting**: 󰂳 (bluetooth with activity)
- **Battery Support**: Shows device battery percentage when available (experimental BlueZ feature)
  - Format: `"󰂱 {device_alias} {device_battery_percentage}%"`
- **Update Interval**: Real-time updates via BlueZ D-Bus events
- **Hover Information**:
  - **Connected**: `"{controller_alias}\n{num_connections} connected\n\n{device_enumerate}"` - controller info with device list
  - **Available**: `"{controller_alias}\nReady to connect"` - controller ready status
  - **Disabled**: `"Bluetooth disabled"` - simple disabled message
- **Click Actions**:
  - **Primary Click**: Launch Bluetooth device manager applet
    - **Option 1**: `blueman-manager` - Full-featured GTK Bluetooth manager
    - **Option 2**: `blueberry` - Simple and elegant Bluetooth configuration tool
    - **Option 3**: `bluetoothctl` in terminal (`wezterm -e bluetoothctl`) - Command-line interface
- **Middle Click**: Toggle Bluetooth on/off (`rfkill toggle bluetooth`)
- **Right Click**: Quick connect/disconnect menu or Bluetooth settings
- **Scroll Actions**:
  - **Scroll Up**: Cycle through paired devices (connect to next)
  - **Scroll Down**: Cycle through paired devices (connect to previous)
- **Bluetooth Management Options**:
  1. **blueman-manager**: Most comprehensive GUI with device pairing, services, and file transfer
  2. **blueberry**: Clean, modern interface focused on connection management
  3. **bluetoothctl**: Command-line tool for advanced users and automation
  4. **System Settings**: Desktop environment's native Bluetooth settings
- **Device Preference**: Configurable priority list for which device to display when multiple are connected
- **Connection Features**:
  - Shows currently connected device name
  - Displays connection count when multiple devices connected
  - Battery percentage for supported devices
  - Quick connect/disconnect functionality
- **Configuration Notes**:
  - Requires `bluetooth.service` to be enabled for proper functionality
  - Auto-detects Bluetooth controllers
  - Supports multiple Bluetooth adapters
  - Real-time connection status updates
  - Works with all BlueZ-compatible devices
