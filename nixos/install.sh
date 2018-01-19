#! /usr/bin/env bash
sudo ln -s ${PWD}/configuration.nix  /etc/nixos/configuration.nix
sudo ln -s ${PWD}/services.nix  /etc/nixos/services.nix
sudo ln -s ${PWD}/bashrc.nix  /etc/nixos/bashrc.nix
sudo ln -s ${PWD}/packages.nix  /etc/nixos/packages.nix
sudo ln -s ${PWD}/web.nix  /etc/nixos/web.nix
sudo ln -s ${PWD}/ui.nix  /etc/nixos/ui.nix
