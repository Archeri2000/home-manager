# Home Manager Configurations

My personal [home-manager](https://github.com/nix-community/home-manager) configurations, which include ZSH plugins, configurations and basic binaries used for development.

## Install Home Manager

To use home configuration, home-manager is needed. Here, I will document both the official way and a convenience script.

### Official

1. Install [nix](https://github.com/NixOS/nix#installation)
2. Install [Home Manager](https://nix-community.github.io/home-manager/index.html#sec-install-standalone)
3. You can edit/update the folder `nixpkgs` at `~/.config/nixpkgs`

### Convenience Script

This repository contains convenience scripts to install both Nix and Home-manager

#### With Single-User Nix (WSL/Linux)

Install Home Manager (and Nix) from scratch:

```
curl -L https://raw.githubusercontent.com/Archeri2000/home-manager/main/scripts/install-home-manager-single.sh | sh
```

#### With Multi-User Nix (MacOS/Linux)

Install Home Manager (and Nix multi-user) from scratch:

```
curl -L https://raw.githubusercontent.com/Archeri2000/home-manager/main/scripts/install-home-manager.sh | sh
```

#### Only Home-Manager (Already have Nix installed)

Install only Home Manager:

```
curl -L https://raw.githubusercontent.com/Archeri2000/home-manager/main/scripts/only-home-manager.sh | sh
```

#### Cheri home.nix

Install my home-manager configurations

```
curl -L https://raw.githubusercontent.com/Archeri2000/home-manager/main/scripts/cheri-config.sh | sh
```

### Cloud-Init

A Ubuntu-based cloud init configuration (which includes my public SSH key and my home-manager configuration) can be found [here](./cloud-init.yaml)

# Credits

Configuration originally obtained from Kirinnee at https://github.com/kirinnee/home-manager
