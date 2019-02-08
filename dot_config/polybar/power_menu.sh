{{- if eq .chezmoi.os "linux" }}
#!/bin/bash

# original script by https://github.com/adi1090x/polybar-themes

MENU="$(rofi -sep "|" -dmenu -i -p 'System' -location 3 -yoffset 60 -xoffset -28 -width 15 -hide-scrollbar -line-padding 4 -padding 20 -lines 4 -font "Fira Code 16" <<< "Lock|Logout|Reboot|Shutdown")"
case "$MENU" in
  *Lock) i3lock-fancy ;;
  *Logout) i3-msg exit;;
  *Reboot) systemctl reboot ;;
  *Shutdown) systemctl -i poweroff
esac
{{- end }}
