# BUG-1: Network connectivity issues when launching Hyprland from SDDM

**Description:**
When launching Hyprland from the SDDM login screen, network services (like Wi-Fi) do not connect automatically. This requires manual intervention. The setup should ensure all necessary user services are started correctly, regardless of the desktop session chosen.

**Status:** TODO

**Technical Analysis:**
This likely relates to how user session services are started. We need to investigate how the Hyprland session is initiated and ensure it's compatible with services managed by `systemd --user` or similar, which KDE might handle differently. The issue could be that the KDE keyring is not being unlocked on login to a non-KDE session, which would prevent NetworkManager from accessing saved Wi-Fi passwords. This is a common issue when mixing desktop environments.
