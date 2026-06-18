# MSN Weapon Overhaul — Skin Texture Placeholders
# 
# Directory structure:
# skins/
#   arasaka_oni_corporate/
#     diffuse.dds
#     normal.dds
#     roughness.dds
#     metalness.dds
#   ...
#
# Texture specifications:
# - Format: DDS (BC7 for diffuse/normal, BC4 for roughness/metalness)
# - Resolution: 2048x2048 (weapons), 1024x1024 (details)
# - Mipmaps: Yes (auto-generated)
# - Color space: sRGB for diffuse, Linear for normal/roughness/metalness
#
# Naming convention:
#   [weapon]_[skin]_[map].dds
#   Example: arasaka_oni_corporate_diffuse.dds
#
# Skin packs defined in tweakdb/weapons.yaml:
# - Modern_Blunt (9 skins)
# - Corp_Brand (7 skins)
# - Tech_Experimental (5 skins)
#
# Total: 21 skins across 14 weapons
#
# Texture generation pipeline:
# 1. Create high-res source in Substance Painter / Blender
# 2. Export as 2048x2048 PNG
# 3. Convert to DDS with NVIDIA Texture Tools:
#    nvcompress -bc7 -mipmap input.png output_diffuse.dds
#    nvcompress -bc5 -mipmap input_normal.png output_normal.dds
#    nvcompress -bc4 -mipmap input_roughness.png output_roughness.dds
#    nvcompress -bc4 -mipmap input_metalness.png output_metalness.dds
# 4. Place in appropriate subdirectory
# 4. Reference in tweakdb/weapons.yaml under SkinPacks

# Quick test pattern (for development):
# Create 1x1 pixel placeholder textures:
# magick convert -size 1x1 xc:white diffuse.dds
# magick convert -size 1x1 xc:gray normal.dds
# magick convert -size 1x1 xc:gray50 roughness.dds
# magick convert -size 1x1 xc:black metalness.dds

# Weapon skin assignments (from weapons.yaml):
#
# Modern_Blunt:
#   Arasaka_Oni_Warhammer: Corporate_Crimson, NCPD_Special, Nomad_Trophy
#   Militech_Breacher_Sledge: Olive_Drab, Executioner_Black
#   KangTao_Dragon_Maul: Dragons_Breath, Permafrost, Stormcaller
#   BudgetArms_Scrap_Bat: Duct_Tape_Special
#
# Corp_Brand:
#   Arasaka: Corporate, NCPD, Nomad
#   Militech: Standard, Execute
#   KangTao: Standard
#   BudgetArms: DuctTape
#
# Tech_Experimental:
#   Liliths_Wrath: Resonance_Violet
#   Ouroboros_LoopBlade: Data_Gold
#   NGDGovernor_SmartGun: Token_Green
#   Lyra_ResonanceBow: Lyra_Shift
#   Sephirot_MultiForm: Sephirotic_Rainbow

# Custom shader requirements (for experimental weapons):
# - Lilith's Wrath: Animated resonance glow shader with vertex displacement
# - Ouroboros Loop-Blade: Holographic edge with scrolling data texture
# - NGD Governor Smart-Gun: Token counter HUD overlay in weapon scope
# - Lyra Resonance Bow: Mode-based color shift vertex shader
# - Sephirot Multi-Form: Configuration glow with Sephirotic rune animation

# Skin unlock conditions (from tweakdb/weapons.yaml MSNSkillTree):
# Tier 1: BudgetArms_DuctTape
# Tier 2: Militech_Standard, Arasaka_Corporate
# Tier 3: KangTao_Standard, Modern_Blunt_Corporate
# Tier 4: Arasaka_NCPD, Militech_Execute
# Tier 5: Resonance_Violet, Token_Green
# Tier 6: Lyra_Shift
# Tier 7: Data_Gold
# Tier 8: Resonance_Violet (Lilith's Wrath)
# Tier 9: Sephirotic_Rainbow
# Tier 10: All skins

# Texture memory budget:
# 21 skins × 4 maps × 2048² × 8 bytes (BC7) ≈ 21 × 4 × 4MB ≈ 336 MB VRAM
# With streaming: ~80 MB active at any time