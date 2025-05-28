# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

LEFT=$(xrandr --query | grep "+0+0" | cut -d" " -f1)
MAIN=$(xrandr --query | grep "+1920+0" | cut -d" " -f1)
RIGHT=$(xrandr --query | grep "+3840+0" | cut -d" " -f1)

if type "xrandr"; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        if [ $m == $LEFT ]; then
            MONITOR=$m polybar --reload tertiary & disown
        elif [ $m == $MAIN ]; then
            MONITOR=$m polybar --reload main & disown
        elif [ $m == $RIGHT ]; then
            MONITOR=$m polybar --reload secondary & disown
        fi
    done
else
    polybar --reload main &
fi
