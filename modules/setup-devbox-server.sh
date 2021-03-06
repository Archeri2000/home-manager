#!/bin/sh

stty -echo
while true; do
	echo "SSH Passphrase:"
	read -r ssh_pass
	echo "Confirm SSH Passphrase:"
	read -r ssh_verify
	if [ "$ssh_pass" = "$ssh_verify" ]; then
		break
	else
		echo "Passphrase Mismatched!"
	fi
done

while true; do
	echo "GPG Passphrase:"
	read -r gpg_pass
	echo "Confirm GPG Passphrase:"
	read -r gpg_verify
	if [ "$gpg_pass" = "$gpg_verify" ]; then
		break
	else
		echo "Passphrase Mismatched!"
	fi
done
stty echo

gpg_name="$(git config --get user.name)"
gpg_email="$(git config --get user.email)"

printf '%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n' "b" "$ssh_pass" "$ssh_pass" "$gpg_name" "$gpg_email" "Devbox Key" "$gpg_pass" "$gpg_pass" | $setup_keys

$set_signing_key
# register-with-github
# register-with-gitlab
