#! /bin/sh

# self-install home manager from scratch
curl -L https://raw.githubusercontent.com/Archeri2000/home-manager/main/scripts/install-home-manager.sh | sh

# clone my config
git clone https://github.com/Archeri2000/home-manager.git "$HOME/home-manager-config"

cd "$HOME/.config" && rm -rf nixpkgs && ln -s "$HOME/home-manager-config" nixpkgs && cd ..

bash --login -c "home-manager switch"

bash --login -c "tmux new -d 'while true; do sudo $(which dockerd); done'"

# Setup SSH and GPG Keys
bash --login -c 'printf '%s\n\n\n%s\n%s\n%s\n%s\n%s\n' "b" "$USER" "ongyuhann@hotmail.com" "Devbox Key" "$gpg_pass" "$gpg_pass" | setup-keys'

# Configure git signing key
bash --login -c "set-signing-key"
