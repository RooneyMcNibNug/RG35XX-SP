#!/bin/bash
ROMS=/run/media/$USER/ROMS/*
BIOS=/run/media/user/ROMS/MUOS/bios/*
SAVES=/run/media/$USER/ROMS/MUOS/save/state/*
RA=/run/media/$USER/ROMS/MUOS/retroarch/
SCREENS=/run/media/$USER/ROMS/MUOS/screenshot
THEME=/run/media/$USER/ROMS/MUOS/theme

mkdir MUOS_BACKUP && cd MUOS_BACKUP

# Saves and States
mkdir SAVES
find $ROMS -name \*.sav -exec cp {} SAVES/. \;
find $SAVES -name \*.state* -exec cp {} SAVES/. \;
find $SAVES -name \*.png -exec cp {} SAVES/. \;

# RetroArch main configurations
mkdir RETROARCH
find $RA -name retroarch*.cfg -exec cp {} RETROARCH/. \;

# All BIOS files
mkdir BIOS
rsync -axuv $BIOS BIOS/.

# Game screenshots
mkdir SCREENSHOTS
find $SCREENS -name \*.png -exec cp {} SCREENSHOTS/. \;

# Rename with current date
cd ..
mv MUOS_BACKUP MUOS_BACKUP_$(date +"%d-%m-%Y")
