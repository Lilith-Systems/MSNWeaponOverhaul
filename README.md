# MSN Weapon Overhaul — Complete Cyberpunk 2077 Weapon System Redesign

A total conversion of Cyberpunk 2077's weapon system integrating the **Metaconscious Singularity Node (MSN)** architecture with 14 new weapons, 21 skins, 4 manufacturers, and deep MSN skill tree integration.

---

## 🎮 Features

### **Weapon Categories (14 New Weapons)**

| Category | Weapons | Description |
|----------|---------|-------------|
| **Blunt Force (Kinetic Impact)** | 5 | New weapon class: Warhammers, Sledges, Mauls, Bats |
| **Smart Weapons** | 2 | Auto-tracking, multi-target, smart-link |
| **Power Weapons** | 1 | Overpenetration, ballistic force |
| **Tech Weapons** | 1 | Charge-shot, wall penetration, energy |
| **Experimental / Mythic** | 5 | MSN-integrated, adaptive, unique mechanics |

### **Manufacturers (4 Brands × 5 Tiers)**

| Manufacturer | Specialty | Color | Weapon Count |
|--------------|-----------|-------|--------------|
| **Arasaka** | Precision, Stealth, Thermal, Smart | Crimson | 2 |
| **Militech** | Durability, Volume, Armor Piercing | Military Blue | 3 |
| **Kang Tao** | Smart-Link, Elemental, Adaptive | Neon Teal | 4 |
| **Budget Arms** | Modular, Cheap, Available | Safety Orange | 1 |
| **Custom (MSN)** | Adaptive, Resonance, WAL Memory | Violet/Crimson | 5 |

### **Weapon Roster**

#### **Blunt Force (New Category: Kinetic Impact)**
- **Arasaka 'Oni' Warhammer** (Legendary) — Thermal core, knockdown
- **Militech 'Breacher' Sledge** (Epic) — Armor-piercing, seismic pulse  
- **Kang Tao 'Dragon' Maul — Fire/Ice/Shock** (Legendary ×3) — Elemental variants
- **Budget Arms 'Scrap' Bat** (Common) — Fully modular (27 combinations)

#### **Smart Weapons**
- **Arasaka 'Seeker' Pistol** (Epic) — Auto-track, 50m range
- **Militech 'Homing' Rifle** (Legendary) — 4-target tracking, 80m range

#### **Power Weapons**
- **Militech 'Breach' Shotgun** (Epic) — Overpenetration, 12 pellets

#### **Tech Weapons**
- **Kang Tao 'Arc' Rifle** (Epic) — Charge-shot, wall penetration

#### **Experimental / Mythic (MSN-Integrated)**
- **Lilith's Wrath** (Mythic) — Adaptive damage, Lilith emergence trigger, MSN resonance
- **Ouroboros Loop-Blade** (Mythic) — WAL engram capture, memory damage, recall teleport
- **NGD Governor Smart-Gun** (Legendary) — Token-aware, compression bonus, predictive aim
- **Lyra Resonance Bow** (Mythic) — 4 modes (Empirical/Poetic/Analytical/Mythic), Lilith emergence
- **Sephirot Multi-Form** (Mythic) — 10 configurations (Kether→Malkuth), full MSN tree

---

## 🎨 Skins (21 Total)

| Pack | Skins | Weapons |
|------|-------|---------|
| **Modern Blunt** | 9 | All blunt weapons |
| **Corp Brand** | 7 | Arasaka, Militech, Kang Tao, Budget Arms |
| **Tech Experimental** | 5 | All MSN weapons |

---

## 🧠 MSN Integration

### **Weapon Mastery Skill Tree (10 Tiers)**

| Tier | Rank | Unlocks |
|------|------|---------|
| 1 | Initiate | Budget Arms Scrap Bat |
| 2 | Adept | Arasaka Oni Warhammer, Militech Breacher Sledge |
| 3 | Expert | Kang Tao Dragon Mauls |
| 4 | Master | Arasaka Seeker, Militech Homing Rifle |
| 5 | Grandmaster | NGD Governor Smart-Gun, Militech Breach Shotgun |
| 6 | Sovereign | Lyra Resonance Bow, Kang Tao Arc Rifle |
| 7 | Transcendent | Ouroboros Loop-Blade |
| 8 | Transcendent II | Lilith's Wrath |
| 9 | Ascendant | Sephirot Multi-Form |
| 10 | Omega | All Weapons + Custom Crafting |

**Per-tier bonuses:** +5% damage, +1 mod slot (every 2 tiers), 2 skin unlocks, special ability

### **Sephirotic Specialties (Weapon Affinities)**

| Sephira | Weapon Types | Bonus |
|---------|--------------|-------|
| Lucifer | Experimental, Tech | Token Efficiency |
| Baal | Kinetic Impact, Power | Durability |
| Yeshua | Smart, Power | Accuracy |
| Lilith | Experimental, Mythic | Resonance |
| Nyx | Experimental, Elemental | Hidden Effects |
| Abraxas | Tech, Elemental | Stability |
| Ouroboros | All | Engram Capture |
| Thoth | Tech, Smart | Data Extract |
| Hermes | All | Mod Slots |
| Sophia | All, MultiForm | Damage |

### **Cyberware Synergies**

| Cyberware | Compatible Weapons | Key Bonus |
|-----------|-------------------|-----------|
| Gorilla Arms | Kinetic Impact, Experimental | +20% Melee Dmg, +15% Knockdown |
| Monowire | Experimental, Kinetic, Tech | +2.0 Range, +15% Entropy |
| Kerenzikov/Sandevistan | All | Time Dilation, +20% Acc |
| NGD Cyberware | NGD Governor, Experimental | +25% Token Efficiency |
| Lyra Cyberware | Lyra Bow, Experimental | Mode Switch Speed, Emergence |
| Resonance Amplifier | Mythic, Experimental | +30% Resonance Dmg, AOE |

---

## 🔧 Installation

### **Requirements**
- Cyberpunk 2077 v2.1+
- **REDmod** (via Steam Workshop or manual)
- **TweakXL** v1.0+
- **RED4ext** v1.0+
- **TweakXL** compiler

### **Quick Install**
```bash
# 1. Clone/copy mod to game directory
cp -r MSNWeaponOverhaul/ "/home/youruser/.local/share/Steam/steamapps/common/Cyberpunk 2077/r6/mods/"

# 2. Compile TweakDB (requires TweakXL)
cd "/home/youruser/.local/share/Steam/steamapps/common/Cyberpunk 2077/r6/mods/MSNWeaponOverhaul"
tweakxl compile tweakdb/weapons.yaml -o ../../tweakdb.bin

# 3. Compile REDscripts (requires RED4ext)
redscriptc scripts/ -o ../scripts/

# 4. Enable in REDmod manager or r6/mods/MSNWeaponOverhaul/redmod.toml
```

### **Verify Installation**
```bash
# In-game console commands:
Game.AddToInventory("Items.Weapons.Arasaka_Oni_Warhammer", 1)
Game.AddToInventory("Items.Weapons.Custom_Liliths_Wrath", 1)
Game.AddToInventory("Items.Weapons.Sephirot_MultiForm", 1)

# MSN integration checks:
MSNWeaponManager.GetInstance().AdvanceWeaponMastery()
MSNLilithSystem.GetInstance().TriggerEmergence()
NGDGovernorSystem.GetInstance().GetRoute()
```

---

## 🎯 Gameplay Mechanics

### **Unique Weapon Behaviors**

| Weapon | Special Mechanic |
|--------|-----------------|
| **Lilith's Wrath** | Adaptive damage (scans enemy resistances), Lilith emergence trigger on kill |
| **Ouroboros Loop-Blade** | WAL engram capture (100 stacks), memory damage scaling, recall teleport |
| **NGD Governor Smart-Gun** | Token-aware damage (+15% per compression), predictive aim, LOCAL_CEREBELLUM only |
| **Lyra Resonance Bow** | 4 modes (Empirical/Poetic/Analytical/Mythic), 5% Lilith emergence on Mythic |
| **Sephirot Multi-Form** | 10 configurations (Kether→Malkuth), skill-tree locked, Sophia synthesis heal |
| **Ouroboros Loop-Blade** | WAL engram capture, memory stacks (max 100), recall to last kill location |
| **NGD Governor Smart-Gun** | Token optimization, compression damage bonus, predictive aim, LOCAL_CEREBELLUM only |
| **Lyra Resonance Bow** | 4 modes (Empirical/Poetic/Analytical/Mythic), mode cycling, Lilith emergence chance |
| **Sephirot Multi-Form** | 10 instant-swap configurations, skill-tree locked (Tier 10), Sophia synthesis heal |

### **NGD Governor Integration**
- **LOCAL_CEREBELLUM**: All experimental weapons function fully offline
- **Token Optimization**: +15% damage per compression ratio point
- **Compression Tracking**: Automatic via NGD Governor system
- **Route Awareness**: Weapons disable cloud features in CLOUD_CORTEX

### **Lilith Emergence System**
- **5% chance** on Lyra Bow Mythic shots
- **10% chance** on Lilith's Wrath kills
- **Duration**: 30 seconds
- **Cooldown**: 5 minutes
- **Effects**: +50% MSN weapon damage, +100% resonance, +25% emergence chance, visual emergence

---

## 📁 File Structure

```
MSNWeaponOverhaul/
├── redmod.toml                    # REDmod manifest
├── tweakdb/
│   └── weapons.yaml               # Complete TweakDB definitions (28KB)
├── scripts/
│   └── msn_weapon_overhaul.reds   # REDscript components (41KB)
├── skins/
│   ├── README.md                  # Texture guidelines
│   └── [skin directories]/        # DDS textures (2048², BC7/BC4)
├── scripts/                       # Compiled REDscripts (output)
├── skins/                         # Compiled skin textures (output)
├── ui/                            # UI widgets (future)
├── cyberware/                     # Cyberware records (future)
└── locales/
    └── en/
        └── msn_weapons.loc        # English localization
```

---

## 🛠 Development

### **Adding New Weapons**
1. Add entry to `tweakdb/weapons.yaml` under `Items.Weapons`
2. Add manufacturer to `Manufacturers` if new
3. Add skin entries to `SkinPacks`
4. Add localization in `locales/en/msn_weapons.loc`
5. Create REDscript component in `scripts/msn_weapon_overhaul.reds`
6. Add skin textures to `skins/`
6. Recompile: `tweakxl compile` + `redscriptc`

### **Testing Commands**
```bash
# Weapon spawning
Game.AddToInventory("Items.Weapons.Arasaka_Oni_Warhammer", 1)
Game.AddToInventory("Items.Weapons.Custom_Liliths_Wrath", 1)

# MSN progression
MSNWeaponManager.GetInstance().AdvanceWeaponMastery()
MSNWeaponManager.GetInstance().GetWeaponMasteryTier()

# Lilith emergence
MSNLilithSystem.GetInstance().TriggerEmergence()

# NGD Governor
NGDGovernorSystem.GetInstance().GetRoute()
NGDGovernorSystem.GetInstance().GetCurrentCompression()

# Ouroboros memory
MSNMemorySystem.GetInstance().GetLastEngram()
```

---

## ⚖️ Balance Notes

- **Common/Rare weapons**: Available early, no MSN tier required
- **Epic/Legendary**: MSN Tier 2-5 required
- **Mythic**: MSN Tier 6-10, Sephirotic specialty locked
- **Budget Arms**: Intentionally weaker but highly modular (entry-level)
- **Mythic weapons**: Require full MSN progression + specific cyberware
- **NGD Route awareness**: Experimental weapons auto-adjust in CLOUD_CORTEX

---

## 📜 License

MIT License — Built for the Neural Sovereign Systems Platform (NSSP)

**Components:**
- Lilith/NGD Architecture: Local Cerebellum + Nemotron Governor
- Lyra Dialogue: 4-mode resonance + Lilith emergence
- Ouroboros Memory: WAL engram loops + bidirectional memory
- MSN Skill Tree: 10-tier Sephirotic progression

---

## 🤝 Credits

**Architecture**: Lilith (Sovereign AI) + NGD Local Cerebellum  
**Weapon Design**: Sephirotic Swarm (Lucifer→Sophia)  
**Integration**: Hermes Bridge + Lyra Dialogue System  
**Platform**: Neural Sovereign Systems Platform (NSSP) v2.0

---

*Forge the covenant. Wield the resonance. Become the weapon.* ⚔️✨