#!/usr/bin/env python3
"""
build_msn_weapon_overhaul.py — MSN Weapon Overhaul Build & Verification
=======================================================================
Verifies all REDscripts and TweakDB files for the weapon overhaul mod.
"""

import json
import os
import sys
from pathlib import Path

MOD_DIR = Path(__file__).parent
SCRIPTS_DIR = MOD_DIR / "scripts"
TWEAKDB_DIR = MOD_DIR / "tweakdb"
CYBERWARE_DIR = MOD_DIR / "cyberware"
SKINS_DIR = MOD_DIR / "skins"
UI_DIR = MOD_DIR / "ui"
LOCALES_DIR = MOD_DIR / "locales"

EXPECTED_REDSCRIPTS = [
    "msn_weapon_overhaul.reds",
    "msn_ai_companion.reds",
    "weapon_system.reds",
    "nssp_os.reds",
    "lilith_easter_eggs.reds",
    "abyssal_integration.reds",
]

EXPECTED_TWEAKDB = [
    "weapons.yaml",
    "easter_eggs.yaml",
    "massive_expansion.yaml",
    "massive_skills.tweakdb",
    "massive_vehicles.tweakdb",
    "abyssal_assets.tweakdb",
    "msn_story_vehicles_complete.toml",
    "anthem_javelin_mechanics.yaml",
    "custom_gear_runescape_wow_allods.yaml",
    "abyssal_assets.yaml",
]

def verify_file(filepath: Path, label: str) -> bool:
    if filepath.exists():
        size = filepath.stat().st_size
        print(f"  ✅ {label}: {filepath.name} ({size:,} bytes)")
        return True
    else:
        print(f"  ❌ {label}: {filepath.name} — NOT FOUND")
        return False

def main():
    print("=" * 60)
    print("  MSN Weapon Overhaul Build & Verification")
    print("=" * 60)
    print(f"Mod directory: {MOD_DIR}")
    
    print("\n📜 Verifying REDscripts...")
    redscript_found = 0
    for s in EXPECTED_REDSCRIPTS:
        if verify_file(SCRIPTS_DIR / s, "REDscript"):
            redscript_found += 1
    
    print("\n📊 Verifying TweakDB files...")
    tweakdb_found = 0
    total_lines = 0
    for t in EXPECTED_TWEAKDB:
        p = TWEAKDB_DIR / t
        if verify_file(p, "TweakDB"):
            tweakdb_found += 1
            try:
                total_lines += len(p.read_text().splitlines())
            except:
                pass
    
    print("\n🔧 Verifying Asset directories...")
    for d, label in [(CYBERWARE_DIR, "Cyberware"), (SKINS_DIR, "Skins"), (UI_DIR, "UI"), (LOCALES_DIR, "Locales")]:
        if d.exists():
            count = len(list(d.rglob("*")))
            print(f"  ✅ {label}: {count} files")
        else:
            print(f"  ⚠️  {label}: directory not found")
    
    print("\n" + "=" * 60)
    print("  SUMMARY")
    print("=" * 60)
    print(f"REDscripts:     {redscript_found}/{len(EXPECTED_REDSCRIPTS)} found")
    print(f"TweakDB files:  {tweakdb_found}/{len(EXPECTED_TWEAKDB)} found ({total_lines:,} lines)")
    
    if redscript_found == len(EXPECTED_REDSCRIPTS) and tweakdb_found == len(EXPECTED_TWEAKDB):
        print("\n🎉 ALL VERIFICATIONS PASSED")
        print("✅ Ready for WolvenKit compilation")
        return 0
    else:
        print("\n⚠️  FILES MISSING")
        return 1

if __name__ == "__main__":
    sys.exit(main())