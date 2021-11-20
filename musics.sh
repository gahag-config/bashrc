alias fm=musics-find

musicdir="/gahag/media/musics/"

function musics-find {
	echo 'Disk:'
	find $musicdir -iregex ".*$*.*"

	echo

	echo 'Todo:'
	green="$(tput setaf 2)"
	gray="$(tput setaf 250)"
	reset="$(tput sgr0)"
	grep -i "$*" /gahag/org/musics.org \
		| sed 's/^\*\+ //' \
		| sed 's/^ \+- //' \
		| sed 's/ =[0-9]\{1,2\}:[0-9]\{2\}=$//' \
		| sed 's/^\(UNR\|DOWNLOAD\|RETRY\|AGAIN\)/'"$green"'\1'"$reset"'/' \
		| sed 's/^\(DONE.*\)$/'"$gray"'\1'"$reset"'/'
		# Remove heading asteriscs, list prefix and time tag. Also highlight TODO keywords.
}


function musics-ffprobe {
	bashrc-require ffmpeg || return 1

	ffprobe -hide_banner "$@"
}


function musics-ffprobe-bitrate { # $@ : Input files
	bashrc-require ffmpeg || return 1

	for f in "$@" ; do
		echo $f $(ffprobe-music "$f" 2>&1 | grep "Hz,.*kb/s")
	done
}


# Usage:
# musics-mount <ip> <directory>
function musics-mount {
	sudo mount -t nfs -o vers=4 $1:/ $2
}


function musics-nfs-start {
	bashrc-require nfs-utils || return 1

	sudo systemctl start nfs-server.service
}

function musics-nfs-stop {
	bashrc-require nfs-utils || return 1

	sudo systemctl stop nfs-server.service
}


extensions=(
	-name '*.mp3' -o
	-name '*.flac' -o
	-name '*.wav' -o
	-name '*.aif' -o
	-name '*.aiff' -o
	-name '*.m4a'
)

function musics-list {
	find $musicdir -type f \( "${extensions[@]}" \) -print0
}

function musics-stats {
	printf "Audio files: "
	musics-list | tr -cd '\0' | wc -c

	printf "Playback time: "
	duration_milis="$(
		musics-list \
			| xargs --null -- mediainfo --Output='Audio;%Duration%\n' \
			| awk NF \
			| paste -s -d + \
			| bc
	)"
	echo "$duration_milis / 1000" | bc
}
