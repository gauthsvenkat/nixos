# Date and Time (`clock`)

## Description
Display current time with seconds and date, with timezone switching and calendar integration

## Position
Right

## Documentation
[Clock Module](https://man.archlinux.org/man/waybar-clock.5.en)

## Configuration
- **Format**: Multi-line display with time above date
  - **Primary Format**: `"{:%H:%M:%S}\n{:%d/%m/%Y}"` - 24-hour time with seconds, date in dd/mm/yyyy format
  - **Timezone Format**: `"{:%H:%M:%S %Z}\n{:%d/%m/%Y}"` - includes timezone abbreviation when cycling
- **Update Interval**: 1 second (for live seconds display)
- **Timezone Support**:
  - **CET**: `"Europe/Amsterdam"` or `"Europe/Berlin"` - Central European Time
  - **IST**: `"Asia/Kolkata"` - Indian Standard Time
  - **Timezones List**: `["Europe/Amsterdam", "Asia/Kolkata"]` for scroll cycling
- **Calendar Integration**:
  - **Mode**: Month view (shows current month)
  - **Calendar Format**: Styled calendar with highlighted today
  - **Week Display**: Week numbers shown on the right
  - **Locale**: Respects system locale for proper day/month names
- **Hover Information**:
  - **Tooltip**: Full calendar view of current month
  - **Format**: `"<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>"` - Month/year header with calendar grid
- **Interaction Actions**:
  - **Scroll Up**: Switch to next timezone (CET → IST)
  - **Scroll Down**: Switch to previous timezone (IST → CET)
  - **Click**: Open system calendar application
    - **GNOME**: `gnome-calendar`
    - **KDE**: `korganizer` or `kalendar`
    - **Generic**: `gsimplecal` or system default calendar
