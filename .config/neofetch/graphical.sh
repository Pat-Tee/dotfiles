if [ $DISPLAY = 0 ]; then
    echo -n "X11"
elif [ $WAYLAND_DISPLAY = "wayland-1" ]; then
    echo -n "Wayland"
    elif uname -r | grep microsoft &> /dev/null; then
    echo -n "WSL"
else
    echo "tty or unknown"
fi
