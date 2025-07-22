# Network (`network`)

## Description
Display network connectivity with connection-type icons and signal strength

## Position
Right

## Documentation
[Network Module](https://github.com/Alexays/Waybar/wiki/Module:-Network)

## Configuration
- **Connection Type Detection**: Automatic interface detection (wifi/ethernet)
- **Format Variants**:
  - **WiFi Connected**: `"{icon} {essid}"` - signal strength icon + network name
  - **Ethernet Connected**: `"󰈀 {ifname}"` - ethernet icon + interface name
  - **WiFi Disconnected**: `"󰤭 Disconnected"` - disconnected wifi icon
  - **Ethernet Disconnected**: `"󰈂 Disconnected"` - disconnected ethernet icon
  - **No Network**: `"󰤭 No Network"` - no connectivity icon
- **WiFi Signal Strength Icons**: Dynamic icons based on signal strength (low to high)
  - `["󰤯", "󰤟", "󰤢", "󰤥", "󰤨"]` - 0-20%, 21-40%, 41-60%, 61-80%, 81-100%
- **Ethernet Icons**:
  - Connected: `"󰈀"` (ethernet cable connected)
  - Disconnected: `"󰈂"` (ethernet cable disconnected)
- **Update Interval**: 5 seconds
- **Hover Information**:
  - **WiFi**: `"{essid} ({signalStrength}%)\nIP: {ipaddr}\nGateway: {gwaddr}"` - network name, signal, IP, gateway
  - **Ethernet**: `"{ifname}\nIP: {ipaddr}/{cidr}\nGateway: {gwaddr}"` - interface, IP with subnet, gateway
  - **Disconnected**: `"No network connection"` - simple disconnection message
- **Click Actions**:
  - **Primary Click**: Launch `nm-applet` or `nm-connection-editor` (NetworkManager GUI)
  - **Right Click**: Open `wezterm -e nmtui` (NetworkManager terminal interface)
  - **Alternative**: Use `rofi-network-manager` for a rofi-style network selector
- **Scroll Actions**:
  - **Scroll Up**: Cycle to next available network interface
  - **Scroll Down**: Cycle to previous available network interface
- **Network Management Options**:
  1. **nm-applet**: System tray NetworkManager applet for GUI network management
  2. **nmtui**: Terminal-based NetworkManager interface
  3. **rofi-network-manager**: Rofi-integrated network selection menu
  4. **nm-connection-editor**: Full NetworkManager connection editor
- **Configuration Notes**:
  - Auto-detects wifi/ethernet interfaces
  - Family: "ipv4" for IP address display
  - Max length: 50 characters to prevent overflow
