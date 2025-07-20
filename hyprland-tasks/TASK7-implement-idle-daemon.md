# Task 7: Implement Idle Daemon

**Description:**  
Configure system idle behavior and power management.

**Suggestions:**  
- `hypridle`

**Functional Requirements:**  
- Lock screen after timeout
- Turn off display after longer timeout

**Nice-to-haves:**  
- System sleep after extended timeout
- Gradual brightness reduction
- Caffeine mode toggle

**Architecture:**  
- Sleep inhibition via lock file mechanism
- Conditional hypridle configuration
- Waybar module for status/control
- Hyprlock integration (if supported)
