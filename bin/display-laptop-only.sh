#!/bin/sh
case $(hostname) in
    baloo)
        xrandr \
            --output eDP-1 --primary --mode 1920x1080 --rotate normal \
            --output DP-1 --off \
            --output DP-1-1 --off \
            --output DP-1-2 --off \
            --output DP-1-3 --off \
            --output DP-2 --off \
            --output HDMI-1 --off
        ;;

    sherekhan)
        xrandr \
            --output eDP-1 --primary --mode 1920x1200 --rotate normal \
            --output DP-1 --off \
            --output DP-2 --off \
            --output DP-3 --off \
            --output DP-3-1 --off \
            --output DP-3-2 --off \
            --output DP-3-3 --off \
            --output DP-4 --off \
            --output HDMI-1 --off
        ;;

    *)
        echo "unknown laptop: $(hostname)" >&2
        exit 1
        ;;
esac
