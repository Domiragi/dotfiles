[Mpv](https://mpv.io/) is a lightweight multimedia player that allows for customization.

# Installation

## Base Mpv
https://mpv.io/installation/

## My config files
**Windows**

Download and copy all files and folders from the git repo to "%APPDATA%/mpv/", which is generally: "C:\users\USERNAME\AppData\Roaming\mpv\".

**Linux/Unix systems**

Download and copy all files and folders to "~/.config/mpv".

**NOTE:**
Mpv may disable Screen Saver on Unix systems, check the official doc for fix: https://mpv.io/manual/stable/#linux-desktop-issues

# Configuration
For internal system, you should first checkout [the official documents](https://mpv.io/manual/master/) to get an idea of what you want to change, and use it for later references. If you want to, check the codebase for the [OSC](https://github.com/mpv-player/mpv/blob/master/player/lua/osc.lua) and [Stats](https://github.com/mpv-player/mpv/blob/master/player/lua/stats.lua), and adapt it to your needs.

For theming, I use the theme [MordenX](https://github.com/dexeonify/mpv-config) by u/dexeonify, which is a fork of the [theme by u/cyl0](https://github.com/cyl0/MordenX) and has been configured to work with the scripts [Thumbnailer.lua](https://github.com/deus0ww/mpv-conf/blob/master/scripts/Thumbnailer.lua) and [Thumbnailer_Worker.lua](https://github.com/deus0ww/mpv-conf/blob/master/scripts/Thumbnailer_Worker.lua) from u/deus0ww for showing thumbnail on the seekbar.

I have a regular GPU, so I don't use any specific shaders or scalers. If you have a decently good one and want extra fine-tuning capability for better video output, check the [Guides section](#guides).

# TODO
- [ ] Make the the thumbnail scale properly when resizing the window

# References
Official documents: https://mpv.io/manual/master/

Official Github: https://github.com/mpv-player/mpv/

## Themes
- https://github.com/dexeonify/mpv-config
- https://github.com/cyl0/MordenX

## User Scripts
- [fuzzydir.lua](https://github.com/sibwaf/mpv-scripts/blob/master/fuzzydir.lua) : recursively searching through directories, to be used with `sub-file-paths` and `audio-file-paths`
- [autoload.lua](https://github.com/mpv-player/mpv/blob/master/TOOLS/lua/autoload.lua) : automatically find and add files with similar names to the playlist. I changed the script so that it does on user input, instead of on opening a new file
- [Thumbnailer.lua](https://github.com/deus0ww/mpv-conf/blob/master/scripts/Thumbnailer.lua) and [Thumbnailer_Worker.lua](https://github.com/deus0ww/mpv-conf/blob/master/scripts/Thumbnailer_Worker.lua) : showing thumbnail on the seekbar
- eof.lua: a small script to exit fullscreen when playback ends, if keep-open=yes; also to rewind back to the start when playback ends

## Guides
- https://kokomins.wordpress.com/2019/10/14/mpv-config-guide/
- https://iamscum.wordpress.com/guides/videoplayback-guide/mpv-conf/

## Additional Resources
- https://github.com/mpv-player/mpv/wiki/User-Scripts
- https://github.com/darsain/uosc : Has a customizable menu
- https://github.com/jonniek/mpv-playlistmanager : Playlist manager
- https://github.com/davidde/mpv-autosub : automatically download subtitle