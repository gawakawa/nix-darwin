{
	description = "Darwin system flake";

	inputs = {
		nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
		nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-23.11-darwin";
		nix-darwin = {
			url = "github:LnL7/nix-darwin";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		home-manager = {
			url = "github:nix-community/home-manager/release-23.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = inputs@{ self, nixpkgs, nix-darwin, home-manager, ... }:
	{
		# Build darwin flake using:
		# $ darwin-rebuild build --flake ".#mac" --impure
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
			];
			specialArgs = { inherit (inputs) self nixpkgs; };
		};

		# Expose the package set, including overlays, for convenience.
		darwinPackages = self.darwinConfigurations."mac".pkgs;
	};
}
