# V-SafeMiniGame

## Overview

**v-safeminigame** is a FiveM safe cracking minigame where players must align 3 rotating dials to match a hidden combination
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

