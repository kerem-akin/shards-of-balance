# Shards of Balance

A 2-D action platformer built solo in **GameMaker Language (GML)**, from an empty project to a finished game with six levels, five enemy types, a dialogue system and a three-phase boss fight.

I taught myself GML from scratch to build it. Development ran from **December 2024 to March 2025**, alongside my GCSE exam preparation — the daily work log in the design document lists 21 tracked build tasks over that period.

> **Play it:** _(itch.io link coming soon)_
> **Project write-up:** [kerem-akin.github.io](https://kerem-akin.github.io/#projects)

![Title screen](https://kerem-akin.github.io/game-menu.jpg)

| | |
|---|---|
| ![Level one](https://kerem-akin.github.io/game-level1.jpg) | ![The Forsaken Cavern](https://kerem-akin.github.io/game-cave.jpg) |
| Level one — the forest biome | The hidden cavern, with its own lighting and particle systems |
| ![Witch's Infernal Blaze](https://kerem-akin.github.io/game-ability.jpg) | ![Boss fight](https://kerem-akin.github.io/game-boss.jpg) |
| The special ability, unlocked from a chest | The final fight against Exilion |

---

## The game

The Crystal of Balance has shattered and the realm it held together is corrupting. You play an explorer who fights through six levels to recover its scattered shards.

| | |
|---|---|
| **Levels** | 6 hand-built rooms across forest, cavern and boss-arena biomes, plus a secret cave level |
| **Enemies** | Skeleton (chaser), Plant (slow, high health), Fire Spirit (ranged), Haunted Skull (applies a speed debuff), Archer, plus an enemy spawner |
| **NPCs** | Satella, Altair and Vorthion — each with scripted dialogue that carries the story |
| **Progression** | Health and speed potions, breakable crates, fire traps, a chest that grants a special ability |
| **Boss** | Exilion, with a charge attack, a spawn phase and an enraged phase |
| **Ending** | Two scripted cutscenes — the shards fusing, and the realm restored |

---

## Engineering notes

### Enemy variants: one object, many difficulty tiers

Difficulty had to rise across six levels without writing a new enemy for each one. Instead, each enemy object reads its **speed, damage and health from its creation event**, and spawns a visual effect above itself so the player can read the threat instantly:

- a **blue aura** marks a faster-than-normal variant
- a **red effect** marks a variant that deals double damage

One object definition covers every tier, and the game teaches its own rules without a tutorial screen.

### Systems built from scratch

| System | What it does |
|---|---|
| Dialogue | Text boxes for NPCs, with skip-on-keypress and repeat handling |
| Camera | Follows the player, with configurable screen shake on impact |
| Transitions | Room-to-room fades, gated on clearing all enemies in the room |
| Save / continue | Stores the last level reached so the menu can offer "Continue" |
| Cutscenes | Scripted end sequences with a black background controller |
| Lighting | A light-texture system used for the cave biome |
| Particles | Leaf fall, fireflies and per-biome floating particles for ambience |
| Shader | A white flash on the player and enemies when damage lands |
| Parallax | Separate scrolling background controllers for the cave and boss arena |
| Special ability | The Witch's Infernal Blaze — recharges every 30 wand shots, fires a high-damage projectile |

### Testing

The project was tested against a written test plan of 14 cases — wand collision, room transitions and health restoration, animated background assets, menu navigation, speed-effect spawning on buffed enemies, and boss phase transitions among them. Several passed only after code changes, which are recorded in the plan.

### What I would change

Written as part of my own project evaluation, and still accurate:

- enemy AI is reactive rather than genuinely smart — no flanking, no coordination
- the menu is functional but plain
- the difficulty curve between the last level and the boss fight is uneven
- the player carries the same weapon the whole way through; a second weapon would add variety

---

## What is in this repository

This repository contains the **game logic**: the object event code and scripts written in GML.

```
objects/     event code for every object (Create, Step, Draw, Collision, Alarm)
scripts/     shared scripts — dialogue, screen shake, transitions
```

**Art, audio and sprite assets are deliberately not included.** Some are my own (the health-bar hearts, signposts and other pieces drawn in Krita and GameMaker's sprite editor), but many are third-party assets licensed for use in the game from Craftpix, itch.io and GameDevMarket. Redistributing them here would breach those licences, so this repository is limited to the code I wrote. Full asset credits and licence links are recorded in the project's design document.

---

## Running it

The code here is not a drop-in project — without the sprite and sound assets it will not compile as-is. It is published as a record of how the game is built and what the code actually looks like. The playable build will be linked at the top of this page once it is uploaded.

---

*Built by Kerem Akin. Originally developed as coursework for BTEC IT Unit 9 (Games Development) at Dubai British School Emirates Hills, and continued afterwards.*
