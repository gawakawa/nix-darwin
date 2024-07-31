{
	description = "Darwin system flake";

	inputs = {
		nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
		nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-24.05-darwin";
		nix-darwin = {
			url = "github:LnL7/nix-darwin";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		home-manager = {
			url = "github:nix-community/home-manager/release-24.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		purescript-overlay = {
			url = "github:thomashoneyman/purescript-overlay";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = inputs@{ self, nixpkgs, nix-darwin, home-manager,  purescript-overlay, ... }:
	let 
		overlays = {
			purescript = purescript-overlay.overlays.default;
		};
	in
	{
		# Build darwin flake using:
		# $ darwin-rebuild build --flake ".#mac" --impure

		overlays = overlays;

		darwinConfigurations."mac" = nix-darwin.lib.darwinSystem {
			system = "aarch64-darwin";
			modules = [ 
				./configuration.nix 
				# home-manager
				home-manager.darwinModules.home-manager
				{
					home-manager = {
						backupFileExtension = "backup";
						useGlobalPkgs = true;
						useUserPackages = true;
						users.kawa = import /Users/kawa/.config/nix-darwin/home.nix; # HACK: 相対パスで済ませたい
					};
				}

				({ pkgs, ... }: {
					nixpkgs.overlays = builtins.attrValues overlays;
					environment.systemPackages = with pkgs; [
						purs
						spago-unstable
						purs-tidy-bin.purs-tidy-0_10_0
						purs-backend-es
					];
				})
			];
			
			specialArgs = { inherit (inputs) self nixpkgs overlays; };
		};

		# Expose the package set, including overlays, for convenience.
		darwinPackages = self.darwinConfigurations."mac".pkgs;
	};
}
