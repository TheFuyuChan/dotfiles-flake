# Common configuration for all hosts
{
  lib,
  config,
  inputs,
  pkgs,
  outputs,
  ...
}: {
  imports = [
    ./users
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    #useUserPackages = true;
    extraSpecialArgs = {inherit inputs outputs;};
  };

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.stable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

  nix = {
    settings = {
      experimental-features = "nix-command flakes";
      trusted-users = [
        "root"
        "fuyu"
      ]; # Set users that are allowed to use the flake command
    };
    gc = {
      automatic = true;
      options = "--delete-older-than 30d";
    };
    optimise.automatic = true;
    registry =
      (lib.mapAttrs (_: flake: {inherit flake;}))
      ((lib.filterAttrs (_: lib.isType "flake")) inputs);
    nixPath = ["/etc/nix/path"];
  };

  # Fonts
  fonts.packages = with pkgs; [
    # (nerdfonts.override {fonts = ["FiraCode" "DroidSansMono"];})
    #(google-fonts.override {fonts = ["Zen Maru Gothic"];})
    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
  ];

  environment.systemPackages = with pkgs; [
    cifs-utils
    git
    nemo
  ];
  programs.thunar.enable = true;

  hardware.graphics.enable = true;

  services = {
    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;
    desktopManager.plasma6.enable = true;

    flatpak.enable = true;
    xserver = {
      enable = true;
      xkb = {
        layout = "se";
        variant = "";
      };
    };
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    openssh = {
      enable = true;
      settings = {
        # Opinionated: forbid root login through SSH.
        #PermitRootLogin = "no";
        # Opinionated: use keys only.
        # Remove if you want to SSH using passwords
        PasswordAuthentication = true;
      };
    };
  };
  xdg.portal = {
    enable = true;
    config.common.default = "gtk";
  };

  # Keyboard layout
  console.keyMap = "sv-latin1";

  # make pipewire realtime-capable
  security.rtkit.enable = true;

  # Networking
  networking = {
    networkmanager.enable = true;

    nftables.enable = true;
  };

  # Curiously, `services.samba` does not automatically open
  # the needed ports in the firewall.
  networking.firewall.allowedTCPPorts = [445 139];
  networking.firewall.allowedUDPPorts = [137 138];

  # mDNS
  #
  # This part may be optional for your needs, but I find it makes browsing in Dolphin easier,
  # and it makes connecting from a local Mac possible.
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    publish = {
      enable = true;
      addresses = true;
      domain = true;
      hinfo = true;
      userServices = true;
      workstation = true;
    };
    extraServiceFiles = {
      smb = ''
        <?xml version="1.0" standalone='no'?><!--*-nxml-*-->
        <!DOCTYPE service-group SYSTEM "avahi-service.dtd">
        <service-group>
          <name replace-wildcards="yes">%h</name>
          <service>
            <type>_smb._tcp</type>
            <port>445</port>
          </service>
        </service-group>
      '';
    };
  };

  # Basic Theming
  #   qt = {
  #     enable = true;
  #     platformTheme = "gnome";
  #     style = "adwaita-dark";
  # };

  # Shell
  users.defaultUserShell = pkgs.fish;
  programs.fish.enable = true;

  networking.firewall.enable = true;
  networking.firewall.allowPing = true;

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05";
}
