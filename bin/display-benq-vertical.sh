#!/bin/sh

# Hint: use arandr; see ~/.screenlayout/

#!/bin/sh
case $(hostname) in
    baloo)

        # On the left
        # xrandr \
        #     --output eDP-1 --primary --mode 1920x1080 --pos 2160x1670 --rotate normal \
        #     --output DP-1-1 --mode 3840x2160 --pos 0x0 --rotate left \
        #     --output DP-1 --off \
        #     --output DP-1-2 --off \
        #     --output DP-1-3 --off \
        #     --output DP-2 --off \
        #     --output HDMI-1 --off

        # On the right
        xrandr \
            --output eDP-1 --primary --mode 1920x1080 --pos 0x2000 --rotate normal \
            --output DP-1-1 --mode 3840x2160 --pos 1920x0 --rotate right \
            --output DP-1 --off \
            --output DP-1-2 --off \
            --output DP-1-3 --off \
            --output DP-2 --off \
            --output HDMI-1 --off \
        ;;

    sherekhan)
        # On the right
        xrandr \
            --output eDP-1 --primary --mode 1920x1200 --pos 0x1700 --rotate normal \
            --output DP-3-1 --mode 3840x2160 --pos 1920x0 --rotate right \
            --output DP-1 --off \
            --output DP-2 --off \
            --output DP-3 --off \
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
