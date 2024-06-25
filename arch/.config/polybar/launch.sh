# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# Launch Polybar, using default config location ~/.config/polybar/config.ini
polybar mybar 2>&1 | tee -a /tmp/polybar.log & disown

MAIN=$(xrandr --query | grep " connected primary" | cut -d" " -f1)

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
      if [ $m == $MAIN ]; then
        MONITOR=$m polybar --reload main &
      else
        MONITOR=$m polybar --reload secondary &
      fi
  done
else
  polybar --reload main &
fi
