# nixos-config

Personal configuration for [NixOS](https://nixos.org/) with
[Nix Flakes](https://wiki.nixos.org/wiki/Flakes) and
[Home Manager](https://github.com/nix-community/home-manager).

This flake manages **two machines**: **desktop** and **laptop**. Both share
common programs through `programs/common/`, while each machine defines its own
desktop environment and extras.

## Inputs

| Flake | Source | Purpose | Desktop | Laptop |
| --- | --- | --- | :---: | :---: |
| `nixpkgs` | [`github:nixos/nixpkgs/nixos-unstable`](https://github.com/nixos/nixpkgs) | Nix Packages collection | [x] | [x] |
| `home-manager` | [`github:nix-community/home-manager`](https://github.com/nix-community/home-manager) | Home Manager | [x] | [x] |
| `catppuccin` | [`github:catppuccin/nix`](https://github.com/catppuccin/nix) | Catppuccin Theme | [x] | [x] |
| `auto-cpufreq` | [`github:AdnanHodzic/auto-cpufreq`](https://github.com/AdnanHodzic/auto-cpufreq) | CPU frequency scaling (charger/battery) | [ ] | [x] |
| `nix-cachyos-kernel` | [`github:xddxdd/nix-cachyos-kernel`](https://github.com/xddxdd/nix-cachyos-kernel) | CachyOS kernel for NixOS | [x] | [ ] |

## Machines

| | Desktop | Laptop |
| --- | --- | --- |
| Directory | `desktop/` | `laptop/` |
| NixOS attribute | `nixos-desktop` | `nixos-laptop` |
| Home attribute | `enziokam@nixos-desktop` | `enziokam@nixos` |
| Hostname | `nixos-desktop` | `nixos` |
| Desktop | [KDE Plasma 6](https://plasma.kde.org/) | [SwayFX](https://github.com/wlrfx/swayfx) + [Rofi](https://github.com/davatorium/rofi) |
| Kernel | CachyOS (via flake) | latest |

## Layout

- [`flake.nix`](flake.nix)
- [`desktop/`](desktop/), [`laptop/`](laptop/) — per-machine NixOS
  (`configuration.nix`) and Home (`home.nix`) configurations.

### Home Manager
- [`programs/common/`](programs/common/) — configuration shared by every machine.
- [`programs/desktop/`](programs/desktop/), [`programs/laptop/`](programs/laptop/) —
  machine-specific configuration.
- [`programs/archive/`](programs/archive/) — unused configuration files.

## Usage

Two shell aliases are defined per machine (in `programs/*/zsh.nix`):

- `hmu` — apply the Home Manager configuration for the current machine.
- `nrs` — rebuild and switch the NixOS system for the current machine.
