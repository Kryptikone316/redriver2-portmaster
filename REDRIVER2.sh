#!/bin/bash

XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}

if [ -d "/opt/system/Tools/PortMaster/" ]; then
  controlfolder="/opt/system/Tools/PortMaster"
elif [ -d "/opt/tools/PortMaster/" ]; then
  controlfolder="/opt/tools/PortMaster"
elif [ -d "$XDG_DATA_HOME/PortMaster/" ]; then
  controlfolder="$XDG_DATA_HOME/PortMaster"
else
  controlfolder="/roms/ports/PortMaster"
fi

source $controlfolder/control.txt
get_controls

GAMEDIR=/$directory/ports/redriver2
BINARY=REDRIVER2.armhf

cd $GAMEDIR

> "$GAMEDIR/log.txt" && exec > >(tee "$GAMEDIR/log.txt") 2>&1

# Game data is not included. The DRIVER2 folder from your own disc must be copied here.
if [ ! -f "$GAMEDIR/DRIVER2/FRONTEND.BIN" ]; then
  pm_message "DRIVER2 game data not found. Copy the DRIVER2 folder from your disc into ports/redriver2/DRIVER2 and launch again."
  sleep 8
  pm_finish
  exit 1
fi

export SDL_GAMECONTROLLERCONFIG="$sdl_controllerconfig"

pm_platform_helper "$GAMEDIR/$BINARY"

./$BINARY -ini config.ini

pm_finish
