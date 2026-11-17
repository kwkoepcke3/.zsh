#!/usr/bin/env bash

function discordize() {
        ffmpeg -i $1 -fs 8M $2
}

function rsrcon2() {
        rsrcon -a 192.168.0.172:25576 $@
}

function restart_kde() {
	systemctl --user restart plasma-plasmashell
}

function bell() {
	paplay --volume 32368 /usr/share/sounds/freedesktop/stereo/complete.oga
}

function wait_headphones_power() {
	
	PERCENT=$1
	# seconds
	CHECK_INTERVAL=60
	DEVICE='/org/freedesktop/UPower/devices/headset_dev_90_DA_07_A4_B4_92'

	while true; do
		# Parse battery percentage
		BATTERY=$(upower -i "$DEVICE" 2>/dev/null | grep percentage | xargs | tr -d '%' | cut -d ' ' -f2)
	
		if [[ -n "$BATTERY" ]] && [[ "$BATTERY" -ge "$PERCENT" ]]; then
			notify-send "Alert" "Headphones at ${BATTERY}%"
			bell
			return
		fi

		sleep "$CHECK_INTERVAL"
	done


}

function timer() {
	TIME=$1
	NOTIFY=$2
	TITLE=$3
	
	sleep $TIME
	if [[ -n $NOTIFY ]]; then
		if [[ -z $TITLE ]]; then
			TITLE="Alert!"
		fi
		notify-send $TITLE $NOTIFY
	fi
	bell
}

function backup_dragonwilds() {
    SAVE_DIR=$DRAGONWILDS/Saved
    # SAVE_DIR="/home/mayo/Software/Steam/steamapps/compatdata/1374490/pfx/drive_c/users/steamuser/AppData/Local/RSDragonwilds/Saved"

    OUTPUT_DIR="/home/mayo/Documents/dragonwilds_backups"
    
    BACKUP_NAME="dragonwilds-$(date +"%m-%d-%y-%H-%M-%S").tar.gz"

    tar -C "$SAVE_DIR" -czvf "$OUTPUT_DIR/$BACKUP_NAME" SaveCharacters SaveGames

    notify-send "Dragonwilds" "Backup created!"
    bell
}

function newest() {
    ls -t $1* | head -n 1
}
