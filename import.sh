#!/bin/bash

function usage() {
	echo "usage : ./import.sh <sublime, bashrc> <import, revert>" 1>&2
}


if [ $# != 2 ]; then
	usage
else
	case $1 in 
	sublime)
		TO="$HOME/.config/sublime-text-3/Packages/User"
		FROM="data/sublime/User"
		BK_FOLD=".backup/sublime"
		BK="$BK_FOLD/User"
	;;
	bashrc)
		TO="$HOME/.bashrc"
		FROM="data/system/.bashrc"
		BK_FOLD=".backup/system"
		BK="$BK_FOLD/.bashrc"
	;;
	*)
		echo "invalid first argument" 1>&2
	;;
	esac

	case $2 in
		import)
			if [ -d "$BK" ] || [ -f "$BK" ]; then
				echo ".backup allready exists" 1>&2
			else
				mkdir -p "$BK_FOLD"
				mv "$TO" "$BK_FOLD"
				cp -r "$FROM" "$TO"
			fi
		;;
		revert)
			if [ -d "$BK" ] || [ -f "$BK" ]; then
				rm -rf "$TO"
				cp -r "$BK" "$TO"
				rm -rf "$BK"
			else
				echo "nothing to revert"
			fi
		;;
		*)
			usage
		;;
	esac
fi


