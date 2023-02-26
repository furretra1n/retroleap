#!/usr/bin/python3

import os
import sys
from collections import namedtuple


App = namedtuple("App", "section name description path extensions icon selectorbrowser")

core_path = "/usr/lib/libretro/"
bin_path = "/usr/bin/"

apps = [
  # Libretro cores. gmenunx will detect these and run retroarch appropriately.
  App("emulators", "Atari800", "Atari 800 Emulator", f"{core_path}atari800_libretro.so", ".zip", "gbc.png", "true"), #TODO: Add extensions
  App("emulators", "CATSFC", "SNES Emulator", f"{core_path}catsfc_libretro.so", ".smc,.zip", 'pocketsnes.png', "true"),
  App("emulators", "FCEUmm", "NES Emulator", f"{core_path}fceumm_libretro.so", ".nes,.zip", "fceux.png", "true"),
  App("emulators", "gpsp", "GBA Emulator", f"{core_path}gpsp_libretro.so", ".gba,.zip", "gbc.png", "true"),
  App("emulators", "imame", "MAME Emulator", f"{core_path}imame4all_libretro.so", ".zip", "mame4all.png", "true"), #TODO: Add extensions
  App("emulators", "PicoDrive", "MegaDrive/Genesis Emulator", f"{core_path}picodrive_libretro.so", ".md,.zip", "picodrive.png", "true"),
  App("emulators", "PocketSNES", "SNES Emulator", f"{core_path}pocketsnes_libretro.so", ".smc,.zip", 'pocketsnes.png', "true"),
  App("emulators", "QuickNES", "NES Emulator",  f"{core_path}quicknes_libretro.so", ".nes,.zip", 'fceux.png', "true"),

  # Standalone games (lf1000)
  App("games", "OhBoy", "Gameboy Emulator",  f"{bin_path}ohboy", ".zip,.gb,.gbc", 'ohboy.png', "true"),
  App("games", "PicoDrive", "MegaDrive/Genesis Emulator (standalone)", f"{bin_path}PicoDrive", ".md,.zip", "picodrive.png", "true"),
  App("games", "PocketSNES", "SNES Emulator (standalone)", f"{bin_path}PocketSNES", ".smc,.zip", "pocketsnes.png", "true"),
  App("games", "Retroarch", "Retroarch (main menu)", f"{bin_path}retroarch", "", "generic.png", "false"),
  App("games", "snes9x4d", "SNES emulator (standalone)", f"{bin_path}snes9x4d", ".smc,.zip", "pocketsnes.png", "true")
]

buildroot_root = sys.argv[1]

print(buildroot_root)
print("rutabega")

for a in apps:
    destpath = os.path.join(buildroot_root, f"configs/.gmenunx/sections/{a.section}")
    os.makedirs(destpath, exist_ok=True)
    with(open(f"{destpath}/{a.name.lower()}", 'w') as f):
        f.write(
           f'''title={a.name}
description={a.description}
icon=skin:icons/{a.icon}
exec={a.path}
volume=1
wrapper=true
selectorbrowser=true
selectordir=/roms/
selectorfilter={a.extensions}
selectorbrowser={a.selectorbrowser}
'''
        )
