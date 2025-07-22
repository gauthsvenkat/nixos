# System Tray (`tray`)

## Description
Standard system tray for applications with tray icon support

## Position
Right

## Documentation
[Tray Module](https://github.com/Alexays/Waybar/wiki/Module:-Tray)

## Configuration
- **Icon Size**: 16px (clean, compact appearance)
- **Icon Spacing**: 4px between tray icons
- **Show Passive Icons**: false (hides inactive/passive system icons for cleaner look)
- **Reverse Direction**: false (icons appear left-to-right in order of appearance)
- **Supported Applications**: Any application that implements freedesktop.org system tray specification
  - VPN clients (Mullvad, ProtonVPN, NordVPN)
  - Gaming platforms (Steam, Lutris, GameHub)
  - Communication apps (Discord, Telegram, Slack)
  - Cloud storage (Dropbox, Nextcloud, Syncthing)
  - Media players (Spotify with tray support)
  - Backup tools (Timeshift, Borg Backup)
  - System utilities (KeePassXC, RedShift, Caffeine)
- **Behavior**:
  - Icons appear automatically when applications with tray support start
  - Icons disappear when applications exit or disable tray functionality
  - Click interactions handled by individual applications
  - Standard left/right click and scroll actions as per application design
- **Requirements**:
  - Applications must implement StatusNotifierItem (SNI) or legacy system tray protocols
  - Works with both Qt and GTK applications
  - No manual configuration needed - purely automatic
- **KDE Integration**: Seamlessly shows same applications that would appear in KDE's system tray
