{
  config,
  pkgs,
  lib,
  inputs,
  configs,
  ...
}:  {

  #  Set your hostname
  networking.hostName = "laptop";

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;


  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    icu
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages =
    [
      pkgs.mesa
      pkgs.libGL
      # pkgs.icu4c
    ];

  environment.sessionVariables.LD_LIBRARY_PATH = "${lib.makeLibraryPath [
    pkgs.gdb
    pkgs.libGL
    pkgs.libGLU
    pkgs.libgcc
    pkgs.libxkbcommon
  ]}";

  boot.kernelModules = ["nvidia-uvm"];
  # Bootloader.
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      devices = ["nodev"];
      efiSupport = true;
      useOSProber = true;
    };
  };
  services.xserver.videoDrivers = ["nvidia"];
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = [pkgs.mesa.drivers];
    };

    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.beta;
      modesetting.enable = true;
      powerManagement.enable = false;

      # Fine-grained power management. Turns off GPU when not in use.
      # Experimental and only works on modern Nvidia GPUs (Turing or newer).
      powerManagement.finegrained = false;
      nvidiaSettings = true;
      nvidiaPersistenced = true;
      open = false;
      prime = {
        sync.enable = false;
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
        # integrated
        intelBusId = "PCI:0:2:0";
        #amdgpuBusId = "PCI:1:0:0"

        # dedicated
        nvidiaBusId = "PCI:1:0:0";
      };
    };
  };
  networking.firewall.allowedUDPPorts = [
    15777
    7777
    8000
    15000
  ];

  boot.blacklistedKernelModules = ["nouveau"];

  # Game related
  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };

  #Theme
    #FIXME: Stylix
    stylix = {
    targets.grub.enable = false;
    polarity = "dark";
    #comment out to use wallpaper colors, find themes here https://github.com/tinted-theming/schemes/tree/spec-0.11/base16
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    cursor = {
      name = "Catppuccin-Mocha-Peach-Cursors";
      package = pkgs.catppuccin-cursors;
    };
  };
catppuccin.flavor = "mocha";
catppuccin.enable = true;

  programs.hyprland = {
      enable = true;
      # nvidiaPatches = true;
      xwayland.enable = true;
    };
    environment = {
      sessionVariables = {
        WLR_NO_HARDWARE_CURSORS = "1";
        NIXOS_OZONE_WL = "1";
      };

    };
}
