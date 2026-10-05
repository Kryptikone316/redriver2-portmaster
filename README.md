## Notes

Thanks to the [OpenDriver2 project](https://github.com/OpenDriver2/REDRIVER2) for reimplementing Driver 2 as a standalone, portable engine. This port runs that engine on armhf handhelds with GLES 3.

Game data is not included. You need your own disc copy of Driver 2. Copy the DRIVER2 folder from the disc into `ports/redriver2/DRIVER2` so that `FRONTEND.BIN` sits directly inside it, then launch the port.

## Controls

| Key | Action |
|--|--|
| D-Pad | Steer and navigate menus |
| Start | Pause / menu (Escape on keyboard) |
| Select | Mapped to the C key on keyboard |

Button bindings follow the default keyboard map in `config.ini` under `[kbcontrols_game]`. Edit that file to change them.
