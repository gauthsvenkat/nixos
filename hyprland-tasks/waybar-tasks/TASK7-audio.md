# Audio Control (`wireplumber`)

## Description
Display volume level with mute status using WirePlumber/PipeWire

## Position
Right

## Documentation
[WirePlumber Module](https://man.archlinux.org/man/waybar-wireplumber.5.en)

## Configuration
- **Format**: `"{icon} {volume}%"` - volume icon with percentage
- **Format (Muted)**: `"󰖁 Muted"` - muted icon with text
- **Volume Icons**: Dynamic icons based on volume level
  - `["󰕿", "󰖀", "󰕾", "󰕾"]` - 0%, 1-33%, 34-66%, 67-100%
- **Node Type**: "Audio/Sink" (output device control)
- **Max Volume**: 100% (prevent accidental over-amplification)
- **Update Behavior**: Real-time volume changes via WirePlumber events
- **Hover**: Current audio device name and volume percentage
- **Click Actions**:
  - **Primary Click**: Launch audio device manager applet
    - **Option 1**: `pavucontrol` - Full PulseAudio/PipeWire volume control GUI
    - **Option 2**: `helvum` - GTK-based PipeWire patchbay/mixer
    - **Option 3**: `qpwgraph` - Qt-based PipeWire graph interface
    - **Option 4**: `pwvucontrol` - Native PipeWire volume control (if available)
- **Middle Click**: Toggle mute (`wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle`)
- **Right Click**: Open advanced audio settings (`pavucontrol -t 3` - output devices tab)
- **Scroll Actions**:
  - **Scroll Up**: Increase volume (`wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+`)
  - **Scroll Down**: Decrease volume (`wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-`)
- **Scroll Step**: 5% volume increments
- **Audio Management Options**:
  1. **pavucontrol**: Most comprehensive GUI for device switching and volume control
  2. **helvum**: Visual patchbay interface for advanced routing
  3. **qpwgraph**: Qt-based graph interface with save/load capability
  4. **pwvucontrol**: Modern native PipeWire volume control (newer alternative)
- **Device Status Icons**:
  - **Normal Output**: 󰕾 (speaker icon)
  - **Low Volume**: 󰕿 (quiet speaker)
  - **Medium Volume**: 󰖀 (medium speaker)
  - **High Volume**: 󰕾 (loud speaker)
  - **Muted**: 󰖁 (crossed-out speaker)
- **Configuration Notes**:
  - Automatically detects default audio sink
  - Works with all PipeWire-compatible audio devices
  - Supports both built-in and external audio devices
  - Real-time updates when devices are changed externally
