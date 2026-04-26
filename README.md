# V-SafeMiniGame

## Overview

**V-SafeMiniGame** is a FiveM safe cracking minigame where players must align 3 rotating dials to match a hidden combination

# Preview

<img width="319" height="162" alt="E174DE9A-B6AB-457A-8735-EEDE3AADBDA2" src="https://github.com/user-attachments/assets/e6e4ea8c-c337-4bae-95f3-46c2440ed1e5" />

https://youtu.be/e3wpSIca09M
---

## Features

- 3-digit safe combination system (00–99 per dial)
- Fully synchronized Lua ↔ NUI communication
- Export based integration system
- Keyboard controls
- Sound effects via NUI callbacks
- Success / failure handling
- Configurable debug mode
- Random or predefined combinations

---

## Controls

| Key | Action |
|-----|--------|
| `W` | Increase number |
| `S` | Decrease number |
| `A / Backspace` | Previous dial |
| `D / Space` | Next dial |
| `Enter` | Submit combination |
| `Escape` | Close minigame |

---

## Lua Export Usage

### ▶ Start Minigame

```
local combination = {12, 34, 56}

exports['v-safeminigame']:StartMinigame(function(success)
    if success then
        print("Safe opened!")
    else
        print("Failed or closed")
    end
end, combination)

### Customizing:

- Inside the `success` block, you can change what happens when the player successfully finishes.
- Inside the `else` block, you can change what happens when the player fails.

```

## Need Help?

If you have any technical questions or need support, feel free to join V-Scripts 

Discord: https://discord.gg/vscripts

