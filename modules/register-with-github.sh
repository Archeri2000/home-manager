#!/bin/sh

if [ "$1" = "" ]; then
	key=$(cat "$HOME"/.ssh/id_rsa.pub)
else
	key=$(cat "$HOME"/ssh/"$1")
fi

# Get Github Username
while true; do
	echo "Github Username:"
	read -r github_user
	if [ "$github_user" != "" ]; then
		break
	else
		echo "Empty Username!"
	fi
done

stty -echo
while true; do
	echo "Personal Access Token (Please ensure permissions are given to modify SSH Keys)"
	read -r github_PAT
	if [ "$github_PAT" != "" ]; then
		break
	else
		echo "Empty PAT!"
	fi
done
stty echo

title="$USER-Devbox-$($get_uuid)"

curl \
	-X POST \
	-H "Accept: application/vnd.github.v3+json" \
	-u "$github_user:$github_PAT" \
	https://api.github.com/user/keys \
	-d "{\"key\":\"$key\", \"title\":\"$title\"}"
