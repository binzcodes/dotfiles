alias open='setsid nautilus'
alias batt='upower -i /org/freedesktop/UPower/devices/battery_BAT0'
alias pubip='dig +short txt ch whoami.cloudflare @1.0.0.1'
alias whitenoise="aplay -c 2 -f S16_LE -r 44100 /dev/random"
alias rmnm="npx npkill"

# searchable history
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

# allow **/* pattern matching (probably)
shopt -s globstar